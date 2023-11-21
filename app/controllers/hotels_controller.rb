class HotelsController < ApplicationController
    def index
      @hotels = Hotel.includes(:hotel_images)
      if filter_params_present?
        @hotels = apply_filters(@hotels)
      else
        @hotels = @hotels.order(:title)
      end
      @hotels = @hotels.paginate(page: params[:page], per_page: 10)
    end
  
    def show
      @hotel = Hotel.find(params[:id])
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