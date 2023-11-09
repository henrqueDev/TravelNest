module HotelTypesSeed
    
    def seedHotelTypes()         
        #id=1 para Hotel
        #id=2 para Pousada
        hotel_types = [HotelType.new(name: "Hotel"), HotelType.new(name: "Pousada")]
        for ht in  hotel_types do
            HotelType.find_or_create_by(name: ht.name)
        end
    end

end