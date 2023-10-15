require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'associations' do
    it 'should belong to a hotel_type' do
        ht1 = HotelType.find_or_create_by(name: "Hotel")
        ht2 = HotelType.find_or_create_by(name: "Pousada")
        
        hotel1 = Hotel.find_or_create_by(
          title: "Enopar Sul",
          establishment_description: "Venha desfrutar o sul do Enopar Sul!",
          cnpj: "00.000.001/0002-01",
          evaluation: 4.2,
          hotel_type: ht1
        )
      expect(hotel1.hotel_type).to eq(ht1)
    end

    it 'should have one hotel_location' do
        ht1 = HotelType.find_or_create_by(name: "Hotel")
        ht2 = HotelType.find_or_create_by(name: "Pousada")
        
        hotel1 = Hotel.find_or_create_by(
          title: "Enopar Sul",
          establishment_description: "Venha desfrutar o sul do Enopar Sul!",
          cnpj: "00.000.001/0002-01",
          evaluation: 4.2,
          hotel_type: ht1
        )

        
        brasilObj = Country.where(name: "Brasil").first
        paraibaState = State.where(name: "Paraiba").first
        jpCity = City.where(name: "João Pessoa").first

        hotel_location = HotelLocation.find_or_create_by(positionX: -7.133898, positionY: -34.820414, CEP: "58045-010", 
        nameStreet: "Av. Cabo Branco", number: 428, hotel: hotel1, country: brasilObj, state: paraibaState, city: jpCity)
        
      expect(hotel1.hotel_location).to eq(hotel_location)
    end

    it 'should have many hotel_images' do
        ht1 = HotelType.find_or_create_by(name: "Hotel")
        ht2 = HotelType.find_or_create_by(name: "Pousada")
        
        hotel1 = Hotel.find_or_create_by(
          title: "Enopar Sul",
          establishment_description: "Venha desfrutar o sul do Enopar Sul!",
          cnpj: "00.000.001/0002-01",
          evaluation: 4.2,
          hotel_type: ht1
        )
        hotel_image1 = HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_1.jpg", hotel: hotel1)
        hotel_image2 = HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_2.jpg", hotel: hotel1)
        hotel_image3 = HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_3.jpg", hotel: hotel1)
        hotel_image4 = HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_4.jpg", hotel: hotel1)
        hotel_image5 = HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_5.jpg", hotel: hotel1)
        hotel_image6 = HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_6.jpg", hotel: hotel1)
            
      expect(hotel1.hotel_images).to match_array([hotel_image1, hotel_image2, hotel_image3, hotel_image4, 
      hotel_image5, hotel_image6])
    end
  end

  describe '#image_urls' do
    it 'should return an array of image URLs' do
        ht1 = HotelType.find_or_create_by(name: "Hotel")
        ht2 = HotelType.find_or_create_by(name: "Pousada")
    
    hotel1 = Hotel.find_or_create_by(
      title: "Enopar Sul",
      establishment_description: "Venha desfrutar o sul do Enopar Sul!",
      cnpj: "00.000.001/0002-01",
      evaluation: 4.2,
      hotel_type: ht1
    )
    hotel_image1 = HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_1.jpg", hotel: hotel1)
    hotel_image2 = HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_2.jpg", hotel: hotel1)
    hotel_image3 = HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_3.jpg", hotel: hotel1)
    hotel_image4 = HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_4.jpg", hotel: hotel1)
    hotel_image5 = HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_5.jpg", hotel: hotel1)
    hotel_image6 = HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_6.jpg", hotel: hotel1)
      expect(hotel1.image_urls).to match_array(['joaoPessoaHoteis/enoparSul/imagem_1.jpg', 'joaoPessoaHoteis/enoparSul/imagem_2.jpg', "joaoPessoaHoteis/enoparSul/imagem_3.jpg", 
      "joaoPessoaHoteis/enoparSul/imagem_4.jpg", "joaoPessoaHoteis/enoparSul/imagem_5.jpg", "joaoPessoaHoteis/enoparSul/imagem_6.jpg"])
    end
  end

  describe '#get_location' do
    it 'should return the associated hotel_location' do
        ht1 = HotelType.find_or_create_by(name: "Hotel")
        ht2 = HotelType.find_or_create_by(name: "Pousada")
    
    hotel1 = Hotel.find_or_create_by(
      title: "Enopar Sul",
      establishment_description: "Venha desfrutar o sul do Enopar Sul!",
      cnpj: "00.000.001/0002-01",
      evaluation: 4.2,
      hotel_type: ht1
    )

    brasilObj = Country.where(name: "Brasil").first
    paraibaState = State.where(name: "Paraiba").first
    jpCity = City.where(name: "João Pessoa").first

    
    hotel_location = HotelLocation.find_or_create_by(positionX: -7.133898, positionY: -34.820414, CEP: "58045-010", 
    nameStreet: "Av. Cabo Branco", number: 428, hotel: hotel1, country: brasilObj, state: paraibaState, city: jpCity)
    

      expect(hotel1.get_location).to eq(hotel_location)
    end
  end
end
