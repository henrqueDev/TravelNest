require 'bunny'

class HotelReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy]
  protect_from_forgery with: :null_session

  skip_before_action :verify_authenticity_token
 
  def index
    @reservations = HotelReservation.all.where(user_id: current_user.id)
  end

  def create
    if (params[:key] == 'travelnest2023')
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
        @hotel = Hotel.find(room_option.hotel_id)
        request_send_email("CONCLUIDA", @user.email, @hotel.title, params[:check_in], params[:check_out])
        render json: { reservation: @reservation }
        return
      else
        render json: { error: 'Parametros inválidos!' }
        return
      end
    end
    render json: {error: 'Verificamos que você está tentando criar reservas ilegalmente! Estamos acionando a policia federal!'}
    return
  end

  def destroy
    @reservation = HotelReservation.find(params[:id])
    @reservation.destroy  
    redirect_to hotel_reservations_path, notice: 'Reserva cancelada!'
  end

  private

  def request_send_email(status, user_email, hotel_name, check_in, check_out)
    
    connection = Bunny.new(automatically_recover: false)
    connection.start

    channel = connection.create_channel
    queue = channel.queue('reservas')
    hotel_nome = hotel_name.split(' ')
    channel.default_exchange.publish("#{status} #{user_email} #{hotel_nome.join('')} #{check_in} #{check_out}", routing_key: queue.name)
    puts " [x] Sent 'Hello World!'"

    connection.close
  end

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
