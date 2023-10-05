module CountryStatesCitiesSeed

    def seedCountryStatesCities()
        #Criar um país
        c1 = Country.find_or_create_by(name:"Brasil")

        #Criar 4 estados pra Brasil
        s1 = State.find_or_create_by(name:"Paraiba", country: c1)
        s2 = State.find_or_create_by(name:"Ceará", country: c1)
        s3 = State.find_or_create_by(name:"Paraná", country: c1)
        s4 = State.find_or_create_by(name:"Goiás", country: c1)

        #criar 2 cidades para cada estado
        city1Paraiba = City.find_or_create_by(name:"João Pessoa", state: s1)
        city2Paraiba = City.find_or_create_by(name:"Campina Grande", state: s1)

        city1Ceara = City.find_or_create_by(name:"Fortaleza", state: s2)
        city2Ceara = City.find_or_create_by(name:"Sobral", state: s2)

        city1Parana = City.find_or_create_by(name: "Curitiba", state: s3)
        city2Parana = City.find_or_create_by(name: "Foz do Iguaçu", state: s3)
        
        city1Goias = City.find_or_create_by(name: "Goiânia", state: s4)
        city2Goias = City.find_or_create_by(name: "Anápolis", state: s4)
    end

end