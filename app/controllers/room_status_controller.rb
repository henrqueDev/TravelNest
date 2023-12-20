class RoomStatusController < ApplicationController
     
    def get_room_option

        room_option = RoomOption.find(params[:id])

        render json: room_option
    end

    def get_room_option_dates_disabled
        room_option = RoomOption.find(params[:id])
        rooms = Room.all.where(room_option_id: params[:id])
        
        dates = []
        for room in rooms do
          if room.hotel_reservations != nil
            for reservation in room.hotel_reservations do
              n = reservation.check_in.to_date
              m = reservation.check_out.to_date
              (n..m).each do |date|
                dates.push(date)
              end
            end
          end
        end
        
        begin
          (dates[0]..dates[dates.length-1]).each do |date|
            if dates.count(date) < rooms.length
              dates.delete(date)  
            end
          end
        rescue RangeError
          render json: []
          return
        end

        render json: dates
    end

    def get_all
      room_options = RoomOption.all
      render json: room_options
    end

    private
  
      def set_room_option
        @room_option = RoomOption.find(params[:id])
      end
  
      def room_option_params
        params.require(:room_option).permit(:title, :max_people, :rooms_quantity, :price_per_day, :price_per_Person, :price_per_PersonChild, :free_wifi, :is_children_free, :is_refundable, :hotel_id)
      end

end