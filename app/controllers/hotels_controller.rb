class HotelsController < ApplicationController
    def index
        @hotels = Hotel.includes(:hotel_images).all
    end
end