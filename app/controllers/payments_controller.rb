require './app/controllers/grpc_services/genqrcode_client'
class PaymentsController < ApplicationController
    
    include GenqrcodeClient

    def show  
    end

    def show_by_url
        @url = params[:url]
        render :show
    end

    def create
     payment_url = Payment.new(requestPayment(params[:num]))
     
    respond_to do |format|
          format.html { redirect_to show_by_url_payment_path(url: payment_url.get_url) }
          
          #format.json { render :show, status: :created, location: @payment }
        end
    end

end
