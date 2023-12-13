require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
    
    describe '#show_by_url' do
        it "should render template #show" do
            user = User.create(email: 'user2@example.com', username: 'user2', cpf: '22222222222', password: 'password2', user_type: 1) 
            
            user_id = 1 # ID do usuário
            id_hotel = 1 # ID do hotel
            pix_key = 'sua_chave_pix'

            user.save
            sign_in user

            get :show, params: {  
                pix_key: pix_key,
                id_user: user_id,
                id_hotel: id_hotel
            }

            expect(response).to have_http_status(200)
            expect(response).to render_template(:show)
        end
    end
end