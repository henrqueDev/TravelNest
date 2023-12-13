require './app/controllers/grpc_services/genqrcode_client'
require 'rqrcode'
class PaymentsController < ApplicationController
    before_action :authenticate_user!

    include GenqrcodeClient

    def show  
        @url = params[:url]

    end

    def create
        @room_option = RoomOption.find(params[:room_option_id])
        data_inicial = params[:check_in].to_date
        data_final = params[:check_out].to_date

        days = (data_final - data_inicial).to_i


        diaria = @room_option.price_per_day * days
        adult_price =  @room_option.price_per_Person * params[:adults_quantity].to_f
        child_price =  @room_option.is_children_free? ? 0 : @room_option.price_per_PersonChild *  params[:children_quantity].to_f
        total = diaria + adult_price + child_price

        payment_url = Payment.new(requestPayment(params[:pix_key], params[:id_user], total, params[:id_hotel], params[:check_in], params[:check_out], params[:room_option_id] ))
        respond_to do |format|
            format.html { redirect_to show_path(url: payment_url.get_url) }
            end
    end

end
