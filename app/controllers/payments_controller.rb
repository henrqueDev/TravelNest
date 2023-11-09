require './app/controllers/grpc_services/genqrcode_client'
class PaymentsController < ApplicationController
    before_action :authenticate_user!

    include GenqrcodeClient

    def show  
        @url = params[:url]
    end

    def create
     payment_url = Payment.new(requestPayment(params[:id_user], params[:qnt_cob], params[:id_hotel]))
    respond_to do |format|
          format.html { redirect_to show_path(url: payment_url.get_url) }
        end
    end

end
