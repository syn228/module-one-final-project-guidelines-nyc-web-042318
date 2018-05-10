class Method
    attr_accessor :current_user

    def initialize(current_user)
      @current_user = nil
    end

  def self.sign_in_username
    puts "Please enter your username:
    1. Create Account"
    un = STDIN.gets.chomp.downcase
    if un == "1"
      self.create_account
    else user = User.find_by username: un
    if user == nil
      puts "No username found"
      self.sign_in_username
    else
      sign_in_password
      end
    end
  end

  def sign_in_password
    puts "Please enter your password:"
    pw = STDIN.gets.chomp
    password = User.find_by password: pw
    if password == nil
      puts "Wrong password. Please try again."
      sign_in_password
    else
      puts "Welcome #{password.name}!"
      self.current_user = password
      password.get_city_and_type_name
    end
  end

  def self.create_account

    puts "Please enter your name:"
    a_name = STDIN.gets.chomp
    #need to prevent symbol usage!

    puts "Please create your user name:"
    un = STDIN.gets.chomp.downcase
    while true
    if un.length < 4
      puts "Your user name should be at least 4 characters."
      un = STDIN.gets.chomp.downcase
    elsif un.length > 15
      puts "Your user name cannot exceed 15 characters"
      un = STDIN.gets.chomp.downcase
    elsif User.find_by(username: un) != nil
      puts "This user name already exists, please choose another user name."
      un = STDIN.gets.chomp.downcase
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
    user = User.create(name: a_name, username: un, password: pw)
    puts "Thank you for creating your account!"
    user.get_city_and_type_name
  end




  def site_selector(arr, type_input, new_city)
    puts "Which site would you like to visit?"
    site_selection = STDIN.gets.chomp.to_i
    until site_selection.class == Fixnum && site_selection != 0 && site_selection <= 20
      puts "Please enter a valid number:"
    site_selection = STDIN.gets.chomp.to_i
    end
    site = Site.find_or_create_by(name:arr[(site_selection - 1)], place_type: type_input, city_id: new_city.id)
    Usersite.create(user_id: self.id, site_id: site.id)
    user_finder = Usersite.where(site_id: site.id).map {|usersite| usersite.user_id}

    user_list = user_finder.map {|usi| User.where(id: usi)}.map {|user| user}.flatten.map {|user| user.name}.flatten.uniq
    username_display = user_finder.map {|usi| User.where(id: usi)}.map {|user| user}.flatten.map {|user| user.username}.flatten.uniq

    puts "All users going to this area:"
    user_display = user_list.each_with_index{|list, i| puts "#{i + 1}. #{list}: #{username_display[i]}"}

    puts "Which user do you want to go with?"
    user_selection = STDIN.gets.chomp.to_i
    until user_selection.class == Fixnum && user_selection != 0 && user_selection < user_list.length && self.name != user_list[user_selection - 1]
      puts "Please enter a valid number:"
    user_selection = STDIN.gets.chomp.to_i
    end
    puts "Thank you! We have sent a request to that user!"

  end

  def site_helper_method(type_input, latitude, longitude, radius_input, new_city, additional_input="Yes".downcase)
    arr = site_finder(type_input, latitude, longitude, radius_input)

    site_outputs = arr.each_with_index{|list, i| puts "#{i + 1}. #{list}"}
    if additional_input == "Yes".downcase
      site_selector(arr, type_input, new_city)
      more_of_the_same_site(type_input, latitude, longitude, radius_input, new_city)
    else add_more_sites(type_input, latitude, longitude, radius_input, new_city)
    end
  end

    def more_of_the_same_site(type_input, latitude, longitude, radius_input, new_city)
      puts "Are you interested in any other #{type_input}? (Yes/No)"
      additional_input = STDIN.gets.chomp
        if additional_input == "Yes".downcase
          site_helper_method(type_input, latitude, longitude, radius_input, new_city, additional_input)
        elsif additional_input == "No".downcase
          add_more_sites(type_input, latitude, longitude, radius_input, new_city)
        else puts "Please select yes or no."
          more_of_the_same_site(type_input, latitude, longitude, radius_input, new_city)
      end
    end


  def add_more_sites(type_input, latitude, longitude, radius_input, new_city)
    puts "Do you want to add more sites? Yes/No"
    response = STDIN.gets.chomp

    # until type_input == "No".downcase
    #   site_helper_method(type_input, latitude, longitude, radius_input)
    #   puts "Do you want to add more sites?"
    #   type_input = STDIN.gets.chomp
    # end
    if response == "Yes".downcase
      puts "Please pick another site you would like to visit:"
      additional_type = STDIN.gets.chomp
      site_helper_method(additional_type, latitude, longitude, radius_input, new_city, additional_input="Yes".downcase)
    elsif response == "No".downcase
      puts "Thank you."
      #
    else puts "Please enter yes or no"
      add_more_sites(type_input, latitude, longitude, radius_input, new_city)
    end
  end

end
