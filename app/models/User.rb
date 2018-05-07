class User < ActiveRecord::Base
  belongs_to :usercity
  has_many :cities, through: :usercity
  belongs_to :usersite
  has_many :sites, through: :usersite

  def get_city_and_type_name
    new_array = []
    city_input = gets.chomp
    coordinate_finder(city_input)
    latitude = coordinate_finder(city_input)[0]
    longitude = coordinate_finder(city_input)[1]
    type_input = gets.chomp
    while type_input != "No"
      puts "Do you want to add more sites?"
      site_finder(type_input, latitude, longitude).each do |non_hash|
       non_hash[:results].select do |result|
         new_array << result[:name]
         Site.new(NAME = result[:name], type_input)
        end
      end
      new_array
    end
  end

end
