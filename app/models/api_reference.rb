


def coordinate_finder(city_input)
  cf = RestClient.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{city_input}&key=AIzaSyAfv9BopUtEDnzyZGBGFTf0xHX5Kz-f2mU")
  pcf = JSON.parse(cf)
  latitude = pcf["results"][0]["geometry"]["location"]["lat"]
  longitude = pcf["results"][0]["geometry"]["location"]["lng"]
  City.create(name: city_input)
  puts "Where are you going?"
  [latitude, longitude]
end


def site_finder(type_input, latitude, longitude, radius)
  arr = []
  cf = RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=#{radius}&type=#{type_input}&key=AIzaSyDXstCAzJeedSOFzmbSigCLDWiEbxnj_CI")
  pcf = JSON.parse(cf)
    pcf["results"].select do |array|
        arr << array["name"]
  end
=begin
  Site.all.map do |site|
    site[:name]
  end
=end
  arr.uniq.each {|sites| Site.create(name: sites, place_type: type_input)}
  arr.uniq.sort
  #associate sites with city
end
