class HotelReservationsController < ApplicationController
  #before_action :authenticate_user!
  protect_from_forgery with: :null_session
  #before_action :verify_requester, only: :create, controller: :hotel_reservations
  skip_before_action :verify_authenticity_token
  #def verify_requester
    
  #  solicitante_ip = request.remote_ip
  #  puts(solicitante_ip)
    
  #  permitidos = ["127.0.0.1", "0.0.0.0"]
  #  if permitidos.include?(solicitante_ip)
      # O solicitante é permitido
      # ...
  #    return
  #  else
      
  #    render json: { error: "Solicitante não permitido" }, status: 403
  #  end
  #end
 

  def create
    if (Date.parse(params[:check_in]) >= Date.parse(params[:check_out]))
      render json: { error: 'Data invalida!' }
      return
    end
    room_option = RoomOption.find(params[:room_option_id])
    @user = User.find(params[:user_id])
    @room = find_available_room(room_option)

    if @room.nil?
      render json: { error: 'Quartos indisponiveis!' }
      return
    end

    @reservation = build_reservation(@room, @user)

    if @reservation.valid?
      @reservation.save
      render json: { reservation: @reservation }
    else
      render json: { error: 'Parametros inválidos!' }
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

  def build_reservation(room, user)
    reservation = HotelReservation.new(
      adults_quantity: params[:adults_quantity],
      children_quantity: params[:children_quantity],
      check_in: params[:check_in],
      check_out: params[:check_out],
      room: room,
      total_price: params[:total_price].to_f.round(2),
      user: user
    )

    reservation
  end

  
end
