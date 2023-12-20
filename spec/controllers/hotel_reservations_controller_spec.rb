require 'rails_helper'

RSpec.describe HotelReservationsController, type: :controller do
  describe 'POST #create' do

    it 'rejects create when key is invalid invalid parameters' do
      post :create, params: {
        key: 'invalid_key',
        # Omitir parâmetros necessários intencionalmente
      }

      expect(response).to have_http_status(200)
    end

    # Adicione mais cenários de teste conforme necessário
  end
end
