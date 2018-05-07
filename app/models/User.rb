class User < ActiveRecord::Base
  belongs_to :usercity
  has_many :cities, through: :usercity
  belongs_to :usersite
  has_many :sites, through: :usersite
  def get_city_and_type_name
    save_array = []
    city_input = gets.chomp
    coordinate_finder = RestClient.get('https://maps.googleapis.com/maps/api/geocode/json?address="#{input}"&key=AIzaSyAfv9BopUtEDnzyZGBGFTf0xHX5Kz-f2mU')
    latitude = coordinate_finder[:results][:geometry][:location][:latitude]
    longitude = coordinate_finder[:results][:geometry][:location][:longitude]
    type_input = gets.chomp
    while type_input != "No"
      puts "Do you want to add more sites?"
     t = RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="#{latitude}","#{longitude}"&radius=50000&type="#{type_input}"&key=AIzaSyDXstCAzJeedSOFzmbSigCLDWiEbxnj_CI')
     t.each do |non_hash|
       non_hash[:results].select do |result|
         result[:name]
       end
     end
     save_array <<

    end
  end
end
