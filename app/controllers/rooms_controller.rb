class RoomsController < ApplicationController
     
    def get_room_dates
        room = Room.find(params[:room_id])
        dates = []
        
        if params[:room_id] == ''
            return
        end
        
        for reservation in room.hotel_reservations do

            (reservation.check_in..reservation.check_out).each do |date|
                if dates.include?(date)
                    dates.push(date)
                end
            end

        end

        render json: dates

    end

    def get_room
        room = Room.find(params[:id])
        render json: room
    end
    
    

end