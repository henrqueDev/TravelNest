class HotelReservationsController < ApplicationController
    
  before_action :authenticate_user!

  def create
        #@hotel = Hotel.find(room_option_id : params[:room_option_id])
        @rooms = Room.all.where(room_option_id: params[:room_option_id])
        @user =   User.find(params[:user_id])
        @room = nil
        @dates = []
        for room in @rooms do
          if room.hotel_reservation == nil
              @room = room
              break
          else 
              @dates.push(room.hotel_reservation.check_in..room.hotel_reservation.check_out)
          end
        end
        
        if @room == nil
          (@dates[0]..@dates[@dates.length-1]).each do |date|
            if @dates.count(date) < @rooms.length
              @dates.delete(date)  
            end
          end
        end

        @reservation = HotelReservation.new(adults_quantity: params[:adults_quantity], children_quantity: params[:children_quantity],
          check_in: params[:check_in],
          check_out: params[:check_out],
          room: @room,
          user: @user)

        


        @reservation.total_price = @room.room_option.price_per_day + @room.room_option.price_per_Person + @room.room_option.price_per_PersonChild
        if @reservation.valid?
          @reservation.save
          @room.save
        else
          render :new
        end
  end
    
      private
      
      def build_conditions_reservation
        conditions = {}
        conditions[:hotel_locations] = { country_id: params[:country_id] } if params[:country_id].present?
        
        
  
        conditions.reject! { |_, v| v.blank? }
    
        conditions
      end
      #def reservation_params
      #  params.require(:hotel_reservation).permit(:adults_quantity, :children_quantity, :check_in, :check_out, :room_id, :user_id)
      #end
end
  