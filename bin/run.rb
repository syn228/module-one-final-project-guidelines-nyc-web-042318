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
    find_by_username
    # if un.find_by_username == nil

    #   puts "Cannot find user, please try again or create account.
    #   1. Create Account"
    #   un = STDIN.gets.chomp
    #   un.find_by_username
    #     if User.find_by username: un != nil
    #     x = User.find_by username: un
    #   end
    # end
    # puts "Welcome #{un}!"
    # x.get_city_and_type_name
  end
