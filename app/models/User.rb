class User < ActiveRecord::Base
  belongs_to :usercity
  has_many :cities, through: :usercity
  belongs_to :usersite
  has_many :sites, through: :usersite


  def get_city_and_type_name
    puts Rainbow("Please enter a city name:").magenta
    city_input = gets.chomp.downcase
    new_city = City.find_or_create_by(name:"#{city_input}")
    Usercity.create(city_id: new_city.id, user_id: self.id)
    puts Rainbow("Please enter mile radius:").magenta
    radius_input = gets.chomp.to_i * 1609.34
      until radius_input.class == Float && radius_input != 0
        puts Rainbow("Please enter an actual number:").red
        radius_input = gets.chomp.to_i * 1609.34
      end
    latlng = coordinate_finder(city_input)
    latitude = latlng[0]
    longitude = latlng[1]
    puts Rainbow("Where kind of place are you interested in visiting? (i.e. cafe, restaurant, etc.)
If you would like to see the list of possible sites to choose from, please type 'sites.'").magenta
    type_input = gets.chomp.downcase
    until type_input != "sites"
      Method.site_choices(type_input, latitude, longitude, radius_input, new_city)
      puts Rainbow("Where kind of place are you interested in visiting? (i.e. cafe, restaurant, etc.)
    If you would like to see the list of possible sites to choose from, please type 'sites.'").magenta
      type_input = gets.chomp.downcase
    end
      Method.site_helper_method(type_input, latitude, longitude, radius_input, new_city)
  end
end
