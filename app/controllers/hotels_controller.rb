class HotelsController < ApplicationController
    def index
        @hotels = Hotel.paginate(:page => params[:page], :per_page => 1).includes(:hotel_images).all
    end
end