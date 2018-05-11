class Method
    attr_accessor :current_user

    def initialize(current_user)
      @current_user = nil
    end

  def self.sign_in_username
    puts Rainbow("Please enter your username:
    1. Create Account").blue
    un = STDIN.gets.chomp.downcase
      if un == "1"
        self.create_account
      else user = User.find_by username: un
      if user == nil
        puts Rainbow("No username found").red
        self.sign_in_username
      else
        self.sign_in_password(user)
      end
    end
  end

  def self.sign_in_password(user)
    pw = ask(Rainbow("Please enter your password:  ").blue) { |q| q.echo = "*" }
      if user.password != pw
        puts Rainbow("Wrong password. Please try again.").red
        self.sign_in_password(user)
      else
        puts Rainbow("Welcome #{user.name}!").cyan
        @current_user = user
        user.get_city_and_type_name
    end
  end

  def self.create_account
    puts "Please enter your name:"
    a_name = STDIN.gets.chomp
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
    pw = ask(Rainbow("Please create your password:  ").blue) { |q| q.echo = "*" }
      while true
      if pw.length < 8
        pw = ask(Rainbow("Your password should be at least 8 characters:  ").blue) { |q| q.echo = "*" }
      elsif pw.length >= 16
        pw = ask(Rainbow("Your password cannot exceed 15 characters:  ").blue) { |q| q.echo = "*" }
      else break
      end
    end
      user = User.create(name: a_name, username: un, password: pw)
      puts Rainbow("Thank you for creating your account!").yellow
      self.sign_in_username
  end




  def self.site_selector(arr, type_input, new_city)
    puts Rainbow("Which site would you like to visit?").magenta
      site_selection = STDIN.gets.chomp.to_i
        until site_selection.class == Fixnum && site_selection != 0 && site_selection <= arr.length
          puts Rainbow("Please enter a valid number:").red
          site_selection = STDIN.gets.chomp.to_i
        end
      site = Site.find_or_create_by(name:arr[(site_selection - 1)], place_type: type_input, city_id: new_city.id)
      Usersite.create(user_id: @current_user.id, site_id: site.id)
      user_finder = Usersite.where(site_id: site.id).map {|usersite| usersite.user_id}

      user_list = user_finder.map {|usi| User.where(id: usi)}.map {|user| user}.flatten.map {|user| user.name}.flatten.uniq.delete_if {|names| names == @current_user.name}

      username_display = user_finder.map {|usi| User.where(id: usi)}.map {|user| user}.flatten.map {|user| user.username}.flatten.uniq.delete_if {|eye_d| eye_d == @current_user.id}

        if user_list.length > 0
          puts Rainbow("All users going to this area:").magenta
            user_display = user_list.each_with_index{|list, i| puts "#{i + 1}. #{list}: #{username_display[i]}"}
          puts Rainbow("Which user do you want to go with?").magenta
            user_selection = STDIN.gets.chomp.to_i
          until user_selection.class == Fixnum && user_selection != 0 && user_selection <= user_list.length
            puts Rainbow("Please enter a valid number:").red
              user_selection = STDIN.gets.chomp.to_i
          end
          puts Rainbow("Thank you! We have sent a request to that user!").magenta
        else
          puts Rainbow("Nobody is going to that site yet!").magenta
        end
  end

  def self.site_helper_method(type_input, latitude, longitude, radius_input, new_city, additional_input="Yes".downcase)
    arr = site_finder(type_input, latitude, longitude, radius_input)
    site_outputs = arr.each_with_index{|list, i| puts "#{i + 1}. #{list}"}
      if additional_input == "Yes".downcase
        self.site_selector(arr, type_input, new_city)
        self.more_of_the_same_site(type_input, latitude, longitude, radius_input, new_city)
      else self.add_more_sites(type_input, latitude, longitude, radius_input, new_city)
    end
  end

  def self.more_of_the_same_site(type_input, latitude, longitude, radius_input, new_city)
    puts Rainbow("Are you interested in any other #{type_input}? (Yes/No)").magenta
    additional_input = STDIN.gets.chomp
      if additional_input == "Yes".downcase
        self.site_helper_method(type_input, latitude, longitude, radius_input, new_city, additional_input)
      elsif additional_input == "No".downcase
        self.add_more_sites(type_input, latitude, longitude, radius_input, new_city)
      else puts Rainbow("Please select yes or no.").red
        self.more_of_the_same_site(type_input, latitude, longitude, radius_input, new_city)
    end
  end


  def self.add_more_sites(type_input, latitude, longitude, radius_input, new_city)
    puts Rainbow("Do you want to add more sites? Yes/No").magenta
    response = STDIN.gets.chomp

      if response == "Yes".downcase
        puts Rainbow("Please pick another site you would like to visit:").magenta
        additional_type = STDIN.gets.chomp
        self.site_helper_method(additional_type, latitude, longitude, radius_input, new_city, additional_input="Yes".downcase)
      elsif response == "No".downcase
          puts Rainbow("Thank you!").magenta
      else puts Rainbow("Please enter yes or no").red
        self.add_more_sites(type_input, latitude, longitude, radius_input, new_city)
    end
  end

  def self.site_choices(type_input, latitude, longitude, radius_input, new_city)
    puts "
    amusement_park
    aquarium
    art_gallery
    bakery
    bar
    beauty_salon
    bicycle_store
    book_store
    bowling_alley
    cafe
    campground
    casino
    cemetery
    church
    city_hall
    clothing_store
    convenience_store
    department_store
    electronics_store
    gym
    jewelry_store
    library
    lodging
    movie_theater
    museum
    night_club
    park
    restaurant
    school
    shoe_store
    shopping_mall
    spa
    stadium
    supermarket
    taxi_stand
    train_station
    transit_station
    zoo"
  end





end
