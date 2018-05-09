def sign_in
  puts "Please enter your username:
  1. Create Account"
  un = STDIN.gets.chomp
  if un == "1"
    create_account
  else user = User.find_by username: un
  if user == nil
    puts "No username found"
    sign_in
  else
    puts "Welcome #{user.name}!"
    user.get_city_and_type_name
    end
  end
end

def create_account

  puts "Please enter your name:"
  a_name = STDIN.gets.chomp

  puts "Please create your user name:"
  un = STDIN.gets.chomp
  while true
  if un.length < 4
    puts "Your user name should be at least 4 characters."
    un = STDIN.gets.chomp
  elsif un.length > 15
    puts "Your user name cannot exceed 15 characters"
    un = STDIN.gets.chomp
  else break
    end
  end

  puts "Please create your password"
  pw = STDIN.gets.chomp
  while true
  if pw.length < 8
    puts "Your password should be at least 8 characters."
    pw = STDIN.gets.chomp
  elsif pw.length >= 16
    puts "Your password cannot exceed 15 characters."
    pw = STDIN.gets.chomp
  else break
    end
  end
  User.create(name: a_name, username: un, password: pw)
  puts "Thank you for creating your account!"
  user.get_city_and_type_name
end



# Deliverables




# Require username in the beginning and assoociate it with database



# Maybe add mile-radius option to interpolate into api url
