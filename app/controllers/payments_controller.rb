require './app/controllers/grpc_services/genqrcode_client'
require 'rqrcode'
class PaymentsController < ApplicationController
    before_action :authenticate_user!

    include GenqrcodeClient

    def show  
        @ure = params[:url]
        @code = RQRCode::QRCode.new(@ure)
        @url = @code.as_svg(
            offset:0,
            color: '000',
            shape_rendering: 'crispEdges',
            module_size: 6
        ) 
    end

    def create

        return unless params[:pix_key].present?

        if (Date.parse(params[:check_in]) >= Date.parse(params[:check_out]))
            render json: { error: 'Data invalida!' }
            return
          end

        @user = User.find(params[:user_id])
      
          

        @room_option = RoomOption.find(params[:room_option_id])
        
        @room = find_available_room(@room_option)

        data_inicial = params[:check_in].to_date
        data_final = params[:check_out].to_date

        days = (data_final - data_inicial).to_i


        diaria = @room_option.price_per_day * days
        adult_price =  @room_option.price_per_Person * params[:adults_quantity].to_f
        child_price =  @room_option.is_children_free? ? 0 : @room_option.price_per_PersonChild *  params[:children_quantity].to_f
        total = diaria + adult_price + child_price

        payment_url = Payment.new(requestPayment(params[:pix_key], params[:id_user], total, params[:id_hotel], params[:check_in], params[:check_out], params[:room_option_id],
            params[:children_quantity], params[:adults_quantity] ))
        
        respond_to do |format|
            if(@room == nil)
                format.html { redirect_to hotel_path(id: params[:id_hotel]), notice: "Quartos indisponiveis!" }
            else
                format.html { redirect_to show_path(url: payment_url.get_url) }
            end
        end
    end

    private

    def find_available_room(room_option)
        rooms = Room.where(room_option_id: params[:room_option_id])
    
        rooms.each do |room|
          return room if room.hotel_reservations.empty?
    
          reservation_conflict = check_reservation_conflict(room)
          return room if reservation_conflict.nil?
        end
    
        nil
      end
    
    def check_reservation_conflict(room)
        check_in = Date.parse(params[:check_in])
        check_out = Date.parse(params[:check_out])
    
        room.hotel_reservations.each do |reservation|
          return reservation if (check_in..check_out).overlaps?(reservation.check_in..reservation.check_out)
        end
    
        nil
    end

end
