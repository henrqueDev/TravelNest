require 'rails_helper'

RSpec.describe HotelsController, type: :controller do
  describe 'GET #index' do
    it 'assigns @hotels and renders the index template' do
      ht1 = HotelType.find_or_create_by(name: "Hotel")
      ht2 = HotelType.find_or_create_by(name: "Pousada")
      
      hotel1 = Hotel.find_or_create_by(
        title: "Enopar Sul",
        establishment_description: "Venha desfrutar o sul do Enopar Sul!",
        cnpj: "00.000.001/0002-01",
        evaluation: 4.2,
        hotel_type: ht1
      )
      
      hotel2 = Hotel.find_or_create_by(
        title: "Enopar Norte",
        establishment_description: "Venha desfrutar o norte do Enopar Norte!",
        cnpj: "00.000.002/0002-01",
        evaluation: 4.8,
        hotel_type: ht2
      )

      get :index

      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(assigns(:hotels)).to match_array([hotel1, hotel2])
    end
  end
end
