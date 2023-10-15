class HotelsController < ApplicationController
    def index
        @hotels = Hotel.paginate(:page => params[:page], :per_page => 10).includes(:hotel_images).all
    end
end