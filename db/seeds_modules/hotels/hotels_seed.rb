module HotelsSeed

    
    def seedHotels()

        #id=1 para Hotel
        #id=2 para Pousada
        ht1 =  HotelType.find_or_create_by(name: "Hotel")
        ht2 =  HotelType.find_or_create_by(name: "Pousada")
        
        #Cadastro Hotéis
        Hotel.find_or_create_by(title: "Enopar Sul",establishment_description: "Venha desfrutar o sul do Enopar Sul!",  cnpj: "00.000.001/0002-01", evaluation: 4.2, hotel_type: ht1)
        Hotel.find_or_create_by(title: "Enopar Norte", establishment_description:"Venha desfrutar o norte do Enopar Norte!", cnpj:"00.000.002/0002-01", evaluation: 4.8, hotel_type: ht2)

        

    end

end