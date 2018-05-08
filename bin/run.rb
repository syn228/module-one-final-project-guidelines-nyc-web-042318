require_relative '../config/environment'

  puts "Hello, please sign in or create account to begin:
  1. Sign in
  2. Create Account"
  input = STDIN.gets.chomp.to_i
  until input.class == Fixnum && (input == 1 || input == 2)
    puts "Please enter 1 or 2"
    input = STDIN.gets.chomp.to_i
  end
  if input == 1
    puts "Please enter your username"
    username = STDIN.gets.chomp
    until User.find_by username: username != nil
      puts "Cannot find user, please try again or create account.
      1. Create Account"
      username = STDIN.gets.chomp
      User.find_by username: username
    end
  end

  user.get_city_and_type_name
