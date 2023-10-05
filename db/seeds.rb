# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#
require_relative "./seeds_modules/hotels/hotel_types_seed"
require_relative "./seeds_modules/hotels/hotels_seed"
require_relative "./seeds_modules/location_models/country_states_cities_seed"
include HotelTypesSeed
include HotelsSeed
include CountryStatesCitiesSeed

HotelTypesSeed.seedHotelTypes()
HotelsSeed.seedHotels()
CountryStatesCitiesSeed.seedCountryStatesCities()