module HotelTypesSeed
    
    def seed()         
        #id=1 para Hotel
        #id=2 para Pousada
        hotel_types = [HotelType.new(name: "Hotel"), HotelType.new(name: "Pousada")]
        for ht in  hotel_types do
            HotelType.create(name: ht.name)
        end
    end

end