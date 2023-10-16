require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
    describe '#create' do
        it "should call requestPayment" do
            post :create, params: {num: 100}
            expect(response).to have_http_status(302)
        end
    end
end