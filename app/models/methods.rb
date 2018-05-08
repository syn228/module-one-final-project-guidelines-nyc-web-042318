def find_by_username
  puts "Please enter your username"
  un = STDIN.gets.chomp

  user = User.find_by username: un
  # binding.pry
  if user == nil
    puts "No username found"
    find_by_username
  else
    puts "Welcome #{user.name}!"
  end
end


# Deliverables




# Require username in the beginning and assoociate it with database



# Maybe add mile-radius option to interpolate into api url
