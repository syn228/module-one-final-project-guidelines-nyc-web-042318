


def coordinate_finder(city_input)
  RestClient.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{city_input}&key=AIzaSyAfv9BopUtEDnzyZGBGFTf0xHX5Kz-f2mU")
  latitude = coordinate_finder[:results][:geometry][:location][:latitude]
  longitude = coordinate_finder[:results][:geometry][:location][:longitude]
  City.create(name: city_input)
  puts "Where are you going?"
  [latitude, longitude]
end


def site_finder(type_input, latitude, longitude)
  RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=50000&type=#{type_input}&key=AIzaSyDXstCAzJeedSOFzmbSigCLDWiEbxnj_CI")
  #associate sites with city
end
