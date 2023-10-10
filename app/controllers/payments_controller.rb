require './app/controllers/grpc_services/genqrcode_client'
class PaymentsController < ApplicationController
    
       
    include GenqrcodeClient

    def create
        requestPayment()
    end
end
