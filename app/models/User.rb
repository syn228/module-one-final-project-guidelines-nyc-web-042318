class User < ActiveRecord::Base
  belongs_to :usercity
  has_many :cities, through: :usercity
  belongs_to :usersite
  has_many :sites, through: :usersite

  def get_username
  puts "Hello, please input your username:"
  username = STDIN.gets.chomp
  user = User.create(name: username)
  end

  def get_city_and_type_name
    puts "Put a city name here:"
    city_input = STDIN.gets.chomp
    latlng = coordinate_finder(city_input)
    latitude = latlng[0]
    longitude = latlng[1]
    type_input = STDIN.gets.chomp

    puts "Please enter mile radius:"
    radius_input = STDIN.gets.chomp.to_i * 1609.34
    until radius_input.class == Float && radius_input != 0
      puts "Please enter the actual number:"
      radius_input = STDIN.gets.chomp.to_i * 1609.34
    end

    while true
      puts "Do you want to add more sites?"
      arr = site_finder(type_input, latitude, longitude, radius_input)
      site_outputs = arr[0..-1]
      type_input = STDIN.gets.chomp
    if type_input == "No".downcase
        puts "Thank you."
        puts site_outputs
        break
      end
    end
  end
end
