class HotelsController < ApplicationController

    def index
        if params[:country_id].present? || params[:state_id].present? || params[:city_id].present?
            @country_query = params[:country_id] != '' && params[:city_id].present?  ? " hotel_locations.country_id = #{params[:country_id]} " : ''
            @state_query = params[:state_id] != '' && params[:state_id].present? ? " #{@country_query != '' ? "AND" : ''} hotel_locations.state_id = #{params[:state_id]} " : ''
            @city_query = params[:city_id] != '' && params[:city_id].present? ? " #{@state_query != '' || @country_query != '' ? "AND" : ''} hotel_locations.city_id = #{params[:city_id]} " : ''


            @evaluation_query = params[:evaluation] != '' && params[:evaluation].present? ? " evaluation >= #{params[:evaluation]} " : ''

            @hotels = Hotel.joins(:hotel_location).where("#{@evaluation_query}#{@country_query}#{@state_query}#{@city_query}")
                           .paginate(:page => params[:page], :per_page => 1).includes(:hotel_images).all
        else
            @hotels = Hotel.paginate(:page => params[:page], :per_page => 1).includes(:hotel_images).order(:title).all
        end
    end

    def show
        @hotel = Hotel.find(params[:id])
    end
    
end