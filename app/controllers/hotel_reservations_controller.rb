class HotelReservationsController < ApplicationController
  #before_action :authenticate_user!

  def create
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
      user: user
    )

    calculate_total_price(reservation, room.room_option) if room

    reservation
  end

  def calculate_total_price(reservation, room_option)
    reservation.total_price = room_option.price_per_day +
                              room_option.price_per_Person +
                              room_option.price_per_PersonChild
  end
  
end
