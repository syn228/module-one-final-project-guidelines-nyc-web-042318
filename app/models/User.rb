class User < ActiveRecord::Base
  belongs_to :usercity
  has_many :cities, through: :usercity
  belongs_to :usersite
  has_many :sites, through: :usersite
  def get_city_and_type_name
    save_array = []
    city_input = gets.chomp
    coordinate_finder(city_input)
    latitude = coordinate_finder(city_input)[0]
    longitude = coordinate_finder(city_input)[1]
    type_input = gets.chomp
    while type_input != "No"
      puts "Do you want to add more sites?"
     y = site_finder(type_input, latitude, longitude).each do |non_hash|
       non_hash[:results].select do |result|
         result[:name]
       end
     end
     save_array << y
    end
  end
end
