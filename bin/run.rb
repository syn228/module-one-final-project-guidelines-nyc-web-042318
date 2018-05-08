require_relative '../config/environment'

  puts "Hello, please input your username:"
  username = STDIN.gets.chomp
  user = User.create(name: username)

  user.get_city_and_type_name
