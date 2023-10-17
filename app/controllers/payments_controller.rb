require './app/controllers/grpc_services/genqrcode_client'
class PaymentsController < ApplicationController
    
    include GenqrcodeClient

    def show  
        @url = params[:url]
    end

    def create
     payment_url = Payment.new(requestPayment(params[:num]))
     
    respond_to do |format|
          format.html { redirect_to show_path(url: payment_url.get_url) }
          
          #format.json { render :show, status: :created, location: @payment }
        end
    end

end
