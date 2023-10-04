module HotelsSeed


    
    def seed()
        hotel_types = HotelType.all
        #Cadastro Hotéis
        hotels = [Hotel.new(title: "Enopar Sul",establishment_description: "Venha desfrutar o sul do Enopar Sul!",  
            cnpj: "00.000.001/0002-01", evaluation: 9.2, hotel_types[0]), 
            Hotel.new(title: "Enopar Norte", "Venha desfrutar o norte do Enopar Norte!")]
        for hotel in hotels do
            Hotel.find_or_create_by(title: hotel.title)
        end
    end

end