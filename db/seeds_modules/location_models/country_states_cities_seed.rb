module CountryStatesCitiesSeed

    def seedCountryStatesCities()
        # Criar um país
        brazil = Country.find_or_create_by(name: "Brasil")

        # Criar estados e cidades para o Brasil

        # Norte
        acre = State.find_or_create_by(name: "Acre", country: brazil)
        City.find_or_create_by(name: "Rio Branco", state: acre)
        City.find_or_create_by(name: "Cruzeiro do Sul", state: acre)

        amapa = State.find_or_create_by(name: "Amapá", country: brazil)
        City.find_or_create_by(name: "Macapá", state: amapa)
        City.find_or_create_by(name: "Santana", state: amapa)

        amazonas = State.find_or_create_by(name: "Amazonas", country: brazil)
        City.find_or_create_by(name: "Manaus", state: amazonas)
        City.find_or_create_by(name: "Parintins", state: amazonas)

        para = State.find_or_create_by(name: "Pará", country: brazil)
        City.find_or_create_by(name: "Belém", state: para)
        City.find_or_create_by(name: "Santarém", state: para)

        # Nordeste
        alagoas = State.find_or_create_by(name: "Alagoas", country: brazil)
        City.find_or_create_by(name: "Maceió", state: alagoas)
        City.find_or_create_by(name: "Arapiraca", state: alagoas)

        bahia = State.find_or_create_by(name: "Bahia", country: brazil)
        City.find_or_create_by(name: "Salvador", state: bahia)
        City.find_or_create_by(name: "Feira de Santana", state: bahia)

        ceara = State.find_or_create_by(name: "Ceará", country: brazil)
        City.find_or_create_by(name: "Fortaleza", state: ceara)
        City.find_or_create_by(name: "Juazeiro do Norte", state: ceara)

        paraiba = State.find_or_create_by(name: "Paraíba", country: brazil)
        City.find_or_create_by(name: "João Pessoa", state: paraiba)
        City.find_or_create_by(name: "Campina Grande", state: paraiba)

        piaui = State.find_or_create_by(name: "Piauí", country: brazil)
        City.find_or_create_by(name: "Teresina", state: piaui)
        City.find_or_create_by(name: "Parnaíba", state: piaui)

        rio_grande_norte = State.find_or_create_by(name: "Rio Grande do Norte", country: brazil)
        City.find_or_create_by(name: "Natal", state: rio_grande_norte)
        City.find_or_create_by(name: "Mossoró", state: rio_grande_norte)

        sergipe = State.find_or_create_by(name: "Sergipe", country: brazil)
        City.find_or_create_by(name: "Aracaju", state: sergipe)
        City.find_or_create_by(name: "Nossa Senhora do Socorro", state: sergipe)

        # Sul
        parana = State.find_or_create_by(name: "Paraná", country: brazil)
        City.find_or_create_by(name: "Curitiba", state: parana)
        City.find_or_create_by(name: "Londrina", state: parana)

        rio_grande_sul = State.find_or_create_by(name: "Rio Grande do Sul", country: brazil)
        City.find_or_create_by(name: "Porto Alegre", state: rio_grande_sul)
        City.find_or_create_by(name: "Caxias do Sul", state: rio_grande_sul)

        santa_catarina = State.find_or_create_by(name: "Santa Catarina", country: brazil)
        City.find_or_create_by(name: "Florianópolis", state: santa_catarina)
        City.find_or_create_by(name: "Joinville", state: santa_catarina)

        # Centro-Oeste
        goias = State.find_or_create_by(name: "Goiás", country: brazil)
        City.find_or_create_by(name: "Goiânia", state: goias)
        City.find_or_create_by(name: "Anápolis", state: goias)

        mato_grosso = State.find_or_create_by(name: "Mato Grosso", country: brazil)
        City.find_or_create_by(name: "Cuiabá", state: mato_grosso)
        City.find_or_create_by(name: "Várzea Grande", state: mato_grosso)

        mato_grosso_sul = State.find_or_create_by(name: "Mato Grosso do Sul", country: brazil)
        City.find_or_create_by(name: "Campo Grande", state: mato_grosso_sul)
        City.find_or_create_by(name: "Dourados", state: mato_grosso_sul)

        # Sudeste
        espirito_santo = State.find_or_create_by(name: "Espírito Santo", country: brazil)
        City.find_or_create_by(name: "Vitória", state: espirito_santo)
        City.find_or_create_by(name: "Vila Velha", state: espirito_santo)

        minas_gerais = State.find_or_create_by(name: "Minas Gerais", country: brazil)
        City.find_or_create_by(name: "Belo Horizonte", state: minas_gerais)
        City.find_or_create_by(name: "Uberlândia", state: minas_gerais)

        rio_janeiro = State.find_or_create_by(name: "Rio de Janeiro", country: brazil)
        City.find_or_create_by(name: "Rio de Janeiro", state: rio_janeiro)
        City.find_or_create_by(name: "Nova Iguaçu", state: rio_janeiro)

        sao_paulo = State.find_or_create_by(name: "São Paulo", country: brazil)
        City.find_or_create_by(name: "São Paulo", state: sao_paulo)
        City.find_or_create_by(name: "Campinas", state: sao_paulo)

    end

end