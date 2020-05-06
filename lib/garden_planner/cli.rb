require "pry"
require "colorize"
require "lolcat"

class GardenPlanner::CLI


    def call
                                                                                                                                                                      
    
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
        user = User.new(input)
        puts ""
        puts ""
        puts "                                                  Hello,".green + "#{user.name}".magenta + "! What location would you like to plan your garden?
                                                                          (enter city and state)".green
    
        
        
        second_input = gets.chomp
        user.set_location(second_input)
        user.create_location_html
        scraper = Scraper.new(user.location_html)
        
       
        puts ""
        puts ""
        puts "                                           These are the vegetables that are viable for an outside planting in #{user.location}:".green
        puts ""
        
        
        
        Vegetable.display_vegetables
        puts ""
        puts ""

        puts "                            #{scraper.last_frost}".cyan
        puts ""

        puts "                                           =====Go back type B || To display more type vegetable name || EXIT type C=====".magenta
        puts""
        puts ""
        third_input = gets.chomp
        scraper.scrape_vegetable(third_input)
        Vegetable.display_one(third_input)

        
        
        
        
        
        
        
        #########TODO###########
        #add veggie to veggie garden
        #back option
        #exit option
        #display user's veggie garden sorted alphabetically or by planting_date
        #more info about each veggie from within veggie garden page
        
        #once all of this functionality is added, make it pretty

        #binding.pry
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
