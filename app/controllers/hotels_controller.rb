class HotelsController < ApplicationController
    before_action :authenticate_user!, only: :my_hotels
    load_and_authorize_resource

    def index
      if current_user.user_hotel?
        @hotels = current_user.hotels
      else
        @hotels = Hotel.all
      end
      if filter_params_present?
        @hotels = apply_filters(@hotels)
      else
        @hotels = @hotels.order(:title)
      end
      @hotels = @hotels.paginate(page: params[:page], per_page: 1)
    end

    def new
        @hotel = Hotel.new
        @hotel.build_hotel_location

        @countries = Country.all
      
        @states = State.all
      
        @cities = City.all
    end
      
    def edit
      @hotel = Hotel.find(params[:id])
      @hotel.build_hotel_location

      @countries = Country.all
    
      @states = State.all
    
      @cities = City.all
    end

    def create
      @hotel = Hotel.new(hotel_params)
      @hotel.user = current_user
    
      if params[:hotel][:images].present?
        @hotel.images.attach(params[:hotel][:images])
      end
      if @hotel.save
        respond_to do |format|
          format.html { redirect_to @hotel, notice: 'Hotel criado com sucesso.' }
          end
      else
        @countries = Country.all
        @states = State.all
        @cities = City.all
        render :new
      end
    end
    
  
    def show
      @hotel = Hotel.find(params[:id])
      @hotel_reservation = HotelReservation.new
      @rooms_options = RoomOption.where(hotel_id: params[:id])

    end

    def my_hotels
      @hotels = Hotel.all.where(user_id: current_user.id)
      if filter_params_present?
        @hotels = apply_filters(@hotels)
      else
        @hotels = @hotels.order(:title)
      end
      @hotels = @hotels.paginate(page: params[:page], per_page: 1)
    end

    #def destroy
    #  @hotel = Hotel.find(params[:id])
    #end

    
    private
    
    def hotel_params
      params.require(:hotel).permit(
        :id,
        :title,
        :establishment_description,
        :evaluation,
        :cnpj,
        :hotel_type_id,
        hotel_location_attributes: [:id, :nameStreet, :number, :CEP, :positionX, :positionY , :country_id, :state_id, :city_id]
      )
    end
    private
  
    def filter_params_present?
      params[:country_id].present? || params[:state_id].present? || params[:city_id].present? || params[:evaluation].present?
    end
  
    def apply_filters(hotels)
      hotels.joins(:hotel_location)
            .where(build_conditions)
    end
  
    def build_conditions
      conditions = {}
      conditions[:hotel_locations] = { country_id: params[:country_id] } if params[:country_id].present?
      conditions[:hotel_locations] ||= {}
      conditions[:hotel_locations][:state_id] = params[:state_id] if params[:state_id].present?
      conditions[:hotel_locations][:city_id] = params[:city_id] if params[:city_id].present?
      
      if params[:evaluation].present? && params[:evaluation].to_i > 0
        conditions[:evaluation] = (params[:evaluation].to_i..Float::INFINITY)
      end

      conditions.reject! { |_, v| v.blank? }
  
      conditions
    end
  
    def evaluate_param(evaluation)
      evaluation.to_i if evaluation =~ /\A\d+\z/
    end
  end