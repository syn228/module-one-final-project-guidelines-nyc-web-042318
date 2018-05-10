require_relative '../config/environment'


  Catpix::print_image "airplane3.png",
  :limit_x => 1.5,
  :limit_y => 1.5,
  :center_x => true,
  :center_y => true,
  :bg => "white",
  :bg_fill => false,
  :resolution => "high"

  puts Rainbow("Hello, please sign in or create account to begin:
  1. Sign in
  2. Create Account").blue

  input = STDIN.gets.chomp.to_i
  until input.class == Fixnum && (input == 1 || input == 2)
    puts Rainbow("Please enter 1 or 2").red
    input = STDIN.gets.chomp.to_i
  end
  if input == 1
    Method.sign_in_username
  elsif input == 2
    Method.create_account
  end
