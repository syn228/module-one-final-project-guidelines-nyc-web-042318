class User < ActiveRecord::Base
  belongs_to :usercity
  has_many :cities, through: :usercity
  belongs_to :usersite
  has_many :sites, through: :usersite

  def get_city_and_type_name
    new_array = []
    puts "Put a city name here:"
    city_input = STDIN.gets.chomp
    latlng = coordinate_finder(city_input)
    latitude = latlng[0]
    longitude = latlng[1]
    type_input = STDIN.gets.chomp
    while type_input != "No"
      puts "Do you want to add more sites?"
      site_finder(type_input, latitude, longitude)
      #   non_hash["results"].select do |result|
      #     new_array << result[:name]
          Site.create(name: result[:name], type: type_input)
      new_array
    end
  end

end
