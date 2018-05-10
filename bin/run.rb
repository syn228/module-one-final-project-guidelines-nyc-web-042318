require_relative '../config/environment'

  rainbow = ["#622e90", "#2d3091", "#00aaea", "#02a552", "#fdea22", "#eb443b", "#f37f5a"]
  10.times do
    rainbow.each { |colour| print "    ".bg colour }
    puts
  end


  Catpix::print_image(~/Pictures/airplane.jpeg, options ={
  :limit_x => 1.0,
  :limit_y => 0,
  :center_x => true,
  :center_y => true,
  :bg => "white",
  :bg_fill => true,
  :resolution => "low"})

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
