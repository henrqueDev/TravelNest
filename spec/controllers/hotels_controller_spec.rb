# spec/controllers/hotels_controller_spec.rb
require 'rails_helper'

RSpec.describe HotelsController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    # Adicione mais testes para os diferentes cenários possíveis, como para os filtros, etc.
  end

  describe 'GET #new' do
    it 'renders the new template' do
      user = User.create(email: 'test@example.com', password: 'password123', username: 'testando', cpf: '12345678910', user_type: 1)
      # Faça login do usuário criado (método sign_in é fornecido pelo Devise)
      user.save
      print(user.id)
      sign_in user

      # Agora você pode acessar a action protegida pelo before_action
      get :new
      expect(response).to render_template(:new)
    end
  end

  # Adicione testes semelhantes para outras ações como 'edit', 'create', 'show', etc.

  describe 'POST #create' do
    it 'should get :new if @hotel.save fails ' do
      user = User.create(email: 'test@example.com', password: 'password123', username: 'testando', cpf: '12345678910', user_type: 1)
      # Faça login do usuário criado (método sign_in é fornecido pelo Devise)
      user.save

      sign_in user
      # Defina os parâmetros válidos para criar um hotel
      valid_params = {
        hotel: {
          title: 'Novo Hotel',
          establishment_description: 'abcdefgh',
          cnpj: '321983290821309',
          evaluation: 7.0,
          hotel_type: HotelType.find(1)
        }
      }


      expect(response).to have_http_status(200)
    end
  end
end
