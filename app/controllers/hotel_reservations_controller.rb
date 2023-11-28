class HotelReservationsController < ApplicationController
    def create

        @rooms = Room.where(room_option_id: params[:room_option])
        @room_selected = nil
        @user =   User.find(params[:user_id])

        @reservation = HotelReservation.new(adults_quantity: params[:adults_quantity], children_quantity: params[:children_quantity],
          check_in: params[:check_in],
          check_out: params[:check_out],
          user: @user)

        for room in @rooms do
          if(!room.hotel_reservation.present)
            @reservation.room = room
            @room_selected = room
            break
          end
        end
        
        @reservation.total_price = @room_selected.room_option.price_per_day + @room_selected.room_option.price_per_Person + @room_selected.room_option.price_per_PersonChild
        if @reservation.valid?
          @reservation.save
          @room_selected.update(is_available: false)
        else
          render :new
        end
      end
    
      #private
    
      #def reservation_params
      #  params.require(:hotel_reservation).permit(:adults_quantity, :children_quantity, :check_in, :check_out, :room_id, :user_id)
      #end
end
  