#          *****************************       ATENÇÃO         ******************************
# LEMBRAR SEMPRE DE MANTER A ORDEM DOS SCRIPTS, POIS A ORDEM ERRADA VAI IMPEDIR O CADASTRO DE ALGUNS OBJETOS NO BANCO
#          **********************************************************************************


require_relative "./seeds_modules/hotels/hotel_types_seed"
require_relative "./seeds_modules/hotels/hotels_seed"
require_relative "./seeds_modules/location_models/country_states_cities_seed"

include CountryStatesCitiesSeed
include HotelTypesSeed
include HotelsSeed

CountryStatesCitiesSeed.seedCountryStatesCities()
HotelTypesSeed.seedHotelTypes()
#HotelsSeed.seedHotels()