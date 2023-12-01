class RoomStatusController < ApplicationController
     
    def get_room_dates
        if params[:room_id] == ''
            render json: {}
            return
        end
        room = Room.find(params[:room_id])
        dates = []
        begin
            for date in room.hotel_reservations
            
            rescue
        render json: { states: states }
    end

end