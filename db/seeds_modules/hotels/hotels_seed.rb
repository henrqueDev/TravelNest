module HotelsSeed

    
    def seedHotels()
        brasilObj = Country.where(name: "Brasil").first
        paraibaState = State.where(name: "Paraiba").first
        jpCity = City.where(name: "João Pessoa").first

        #id=1 para Hotel
        #id=2 para Pousada
        ht1 =  HotelType.find_or_create_by(name: "Hotel")
        ht2 =  HotelType.find_or_create_by(name: "Pousada")
        
        #Cadastro Hotéis
        hotel1 = Hotel.find_or_create_by(title: "Enopar Sul", establishment_description: "Venha desfrutar o sul do Enopar Sul!",  cnpj: "00.000.001/0002-01", evaluation: 4.2, hotel_type: ht1)
        hotel2 = Hotel.find_or_create_by(title: "Enopar Norte", establishment_description:"Venha desfrutar o norte do Enopar Norte!", cnpj:"00.000.002/0002-01", evaluation: 4.8, hotel_type: ht2)

        #Cadastro de localização dos Hotéis

        HotelLocation.find_or_create_by(positionX: -7.133898, positionY: -34.820414, CEP: "58045-010", 
        nameStreet: "Av. Cabo Branco", number: 428, hotel: hotel1, country: brasilObj, state: paraibaState, city: jpCity)
        
        HotelLocation.find_or_create_by(positionX: -7.129611803524202, positionY: -34.8236461169115, CEP: "58054-020", 
        nameStreet: " Rua José Ramalho Brunet", number: 110, hotel: hotel2, country: brasilObj, state: paraibaState, city: jpCity)

        #Cadastro de imagens do Hotéis
        HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_1.jpg", hotel: hotel1)
        HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_2.jpg", hotel: hotel1)
        HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_3.jpg", hotel: hotel1)
        HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_4.jpg", hotel: hotel1)
        HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_5.jpg", hotel: hotel1)
        HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparSul/imagem_6.jpg", hotel: hotel1)

        HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparNorte/imagem_1.jpg", hotel: hotel2)
        HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparNorte/imagem_2.jpg", hotel: hotel2)
        HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparNorte/imagem_3.jpg", hotel: hotel2)
        HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparNorte/imagem_4.jpg", hotel: hotel2)
        HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparNorte/imagem_5.jpg", hotel: hotel2)
        HotelImage.find_or_create_by(url: "joaoPessoaHoteis/enoparNorte/imagem_6.jpg", hotel: hotel2)


    end

end