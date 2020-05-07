require "pry"
require "colorize"
require "lolcat"

class GardenPlanner::CLI

     #any variable that the user inputs that the whole app will need should be stored as instance variables, even if the variable is an object

    def call
        intro 
        display_vegetables
        main_menu
        #escit

        
        
        #########TODO###########
        
        
        #exit banner
        #format garden display
        #add menu option to display individual veggie from garden
        #add back menu from veggiegardeninidivdual veggie
        #add final garden back menu options
        #add custom error messages
    end 


    def intro 
        banner = 
        "          ::::::::      :::     :::::::::  :::::::::  :::::::::: ::::    :::      :::::::::  :::            :::     ::::    ::: ::::    ::: :::::::::: :::::::::  
        :+:    :+:   :+: :+:   :+:    :+: :+:    :+: :+:        :+:+:   :+:      :+:    :+: :+:          :+: :+:   :+:+:   :+: :+:+:   :+: :+:        :+:    :+: 
        +:+         +:+   +:+  +:+    +:+ +:+    +:+ +:+        :+:+:+  +:+      +:+    +:+ +:+         +:+   +:+  :+:+:+  +:+ :+:+:+  +:+ +:+        +:+    +:+ 
        :#:        +#++:++#++: +#++:++#:  +#+    +:+ +#++:++#   +#+ +:+ +#+      +#++:++#+  +#+        +#++:++#++: +#+ +:+ +#+ +#+ +:+ +#+ +#++:++#   +#++:++#:  
        +#+   +#+# +#+     +#+ +#+    +#+ +#+    +#+ +#+        +#+  +#+#+#      +#+        +#+        +#+     +#+ +#+  +#+#+# +#+  +#+#+# +#+        +#+    +#+ 
        #+#    #+# #+#     #+# #+#    #+# #+#    #+# #+#        #+#   #+#+#      #+#        #+#        #+#     #+# #+#   #+#+# #+#   #+#+# #+#        #+#    #+# 
         ########  ###     ### ###    ### #########  ########## ###    ####      ###        ########## ###     ### ###    #### ###    #### ########## ###    ###"
    
         puts banner.green

        
        
        input = ""
        puts ""
        puts ""
        puts "                                                    Welcome to the Garden Planner CLI! Please enter your name.".green
        input = gets.chomp
        @user = User.new(input)
        puts ""
        puts ""
        puts "                                                  Hello,".green + " #{@user.name}".magenta + "! What location would you like to plan your garden?
                                                                          (enter city and state)".green
    
        
        
        second_input = gets.chomp
        @user.set_location(second_input)
        @user.create_location_html
        @scraper = Scraper.new(@user.location_html)
        
       
        puts ""
        puts ""
        puts "                                           These are the vegetables that are viable for an outside planting in #{@user.location}:".green
        puts ""
    end

    def main_menu 
        input = gets.chomp 
        if input != "C" && Vegetable.find_by_input(input) != nil
            display_one_vegetable(input)
            main_menu
        elsif input != "C" && input == "garden"
            User.display_garden ############NEED TO PUT CASE STATEMENTS IN DISPLAY GARDEN METHOD TO VIEW VEGETABLE FURTHER THEN FROM THERE TO GO BACK
            main_menu
        elsif input != "C"  && input == "B"
            display_vegetables
            main_menu
        else
            self.escit
        end
    end

    def display_vegetables
        Vegetable.display_vegetables
        puts ""
        puts ""

        puts "                            #{@scraper.last_frost}".cyan
        puts ""
        puts "                         =====To see your vegetable garden type garden || To display more type vegetable name || EXIT type C=====".magenta
        puts""
        puts ""
    end

    def display_one_vegetable(input)
        @scraper.scrape_vegetable(input)
        Vegetable.display_one(input)
    end


    def escit
        banner =
        "          ::::::::   ::::::::   ::::::::  :::::::::       :::::::::  :::   ::: :::::::::: ::: 
        :+:    :+: :+:    :+: :+:    :+: :+:    :+:      :+:    :+: :+:   :+: :+:        :+: 
        +:+        +:+    +:+ +:+    +:+ +:+    +:+      +:+    +:+  +:+ +:+  +:+        +:+ 
        :#:        +#+    +:+ +#+    +:+ +#+    +:+      +#++:++#+    +#++:   +#++:++#   +#+ 
        +#+   +#+# +#+    +#+ +#+    +#+ +#+    +#+      +#+    +#+    +#+    +#+        +#+ 
        #+#    #+# #+#    #+# #+#    #+# #+#    #+#      #+#    #+#    #+#    #+#            
         ########   ########   ########  #########       #########     ###    ########## ### "
         puts banner.green
    end

end





























        ####THIS IS PREVIOUS CODE TO REMIND ME HOW TO WRITE THE CLI########

        #while input != "exit"
         # puts "Welcome to your music library!"
          #puts "To list all of your songs, enter 'list songs'."
         # puts "To list all of the artists in your library, enter 'list artists'."
          #puts "To list all of the genres in your library, enter 'list genres'."
         # puts "To list all of the songs by a particular artist, enter 'list artist'."
         # puts "To list all of the songs of a particular genre, enter 'list genre'."
          #puts "To play a song, enter 'play song'."
         # puts "To quit, type 'exit'."
          #puts "What would you like to do?"
         # input = gets.strip
          #end
    
          #case input
          #when ""
            #list_songs
          #when "list artists"
           # list_artists
          #when "list genres"
           # list_genres
          #when "list artist"
            #list_songs_by_artist
          #when "list genre"
            #list_songs_by_genre
         # when "play song"
           # play_song
          #end
    
        #end
      #end
    #def call
       # puts "Please enter your name!"
       # user = User.new(input)
       # puts "Welcome, #{user.name}"
        
        
       # input = gets.strip.upcase
