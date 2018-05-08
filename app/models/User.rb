class User < ActiveRecord::Base
  belongs_to :usercity
  has_many :cities, through: :usercity
  belongs_to :usersite
  has_many :sites, through: :usersite

  def get_city_and_type_name
    puts "Put a city name here:"
    city_input = STDIN.gets.chomp
    latlng = coordinate_finder(city_input)
    latitude = latlng[0]
    longitude = latlng[1]
    type_input = STDIN.gets.chomp
    while true
      puts "Do you want to add more sites?"
      arr = site_finder(type_input, latitude, longitude)
      site_outputs = arr[0..-1]
      type_input = STDIN.gets.chomp
      if type_input == "No".downcase
        puts "Thank you."
        return site_outputs
      end
    end
  end
end
