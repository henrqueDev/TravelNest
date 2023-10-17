require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
    describe '#create' do
        it "should redirect after post #create" do
            post :create, params: {num: 100}
            expect(response).to have_http_status(302)
        end
    end
    describe '#show_by_url' do
        it "should render template #show" do
            get :show, params: { url:"sadsa" }
            expect(response).to have_http_status(200)
            expect(response).to render_template(:show)
        end
    end
end