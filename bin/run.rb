require_relative '../config/environment'

  puts Rainbow("Hello, please sign in or create account to begin:
  1. Sign in
  2. Create Account").blue

  input = STDIN.gets.chomp.to_i
  until input.class == Fixnum && (input == 1 || input == 2)
    puts "Please enter 1 or 2"
    input = STDIN.gets.chomp.to_i
  end
  if input == 1
    Method.sign_in_username
  elsif input == 2
    Method.create_account
  end
