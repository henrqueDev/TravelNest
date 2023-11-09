class FilterController < ApplicationController
     
    def get_states
        if params[:country_id] == ''
            render json: {}
            return
        end
        country = Country.find(params[:country_id])
        states = country.states
    
        render json: { states: states }
    end

    def get_cities
        if params[:state_id] == ''
            render json: {}
            return
        end
        state = State.find(params[:state_id])
        cities = state.cities
    
        render json: { cities: cities }
    end

end