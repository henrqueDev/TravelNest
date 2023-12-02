class RoomStatusController < ApplicationController
     
    def get_room_datesxbx
        if params[:room_id] == ''
            render json: {}
            return
        end
        room = Room.find(params[:room_id])
        dates = []
            for reservation in room.hotel_reservations do
                for (reservation.check_in..reservation.check_out).each do |date|
                    if !dates.include?(date) 
                        dates.push(date)
                    end
                end
            end
        render json: { dates: dates }
    end

end