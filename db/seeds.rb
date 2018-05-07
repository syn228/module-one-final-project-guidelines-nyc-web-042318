require 'rest-client'


coordinate_finder = RestClient.get('https://maps.googleapis.com/maps/api/geocode/json?address="#{city}"&key=AIzaSyAfv9BopUtEDnzyZGBGFTf0xHX5Kz-f2mU')
#latitude = coordinate_finder[:results][:geometry][:location][:latitude]
#longitude = coordinate_finder[:results][:geometry][:location][:longitude]


city_finder = RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="#{latitude}","#{longitude}"&radius=50000&type="#{type}"&key=AIzaSyDXstCAzJeedSOFzmbSigCLDWiEbxnj_CI')
