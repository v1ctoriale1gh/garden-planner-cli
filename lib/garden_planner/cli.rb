require "pry"
require "colorize"
require "lolcat"

class GardenPlanner::CLI

    def call
        intro 
        display_vegetables
        main_menu
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
                                                                    (Enter City, State or City, ST)".green
    
        
        
        second_input = gets.chomp
        @user.set_location(second_input)
        @user.create_location_html
        @scraper = Scraper.new(@user.location_html)
        
       
        puts ""
        puts ""
        
    end

    def main_menu 
        input = gets.chomp 
        if input.capitalize != "C" && Vegetable.find_by_input(input) != nil
            display_one_vegetable(input)
            main_menu
        elsif input.capitalize != "C" && input.capitalize == "Garden"
            User.display_garden
            main_menu
        elsif input.capitalize != "C"  && input.capitalize == "B"
            display_vegetables
            main_menu
        else
            self.escit
        end
    end

    def display_vegetables
        puts "                                           These are the vegetables that are viable for an outside planting in #{@user.location}:".green
        puts ""
        Vegetable.display_vegetables
        puts ""
        puts ""

        puts "                            #{@scraper.last_frost}".cyan
        puts ""
        puts "                            =====To see your vegetable garden type garden || To display more type vegetable name || EXIT type C=====".magenta
        puts""
        puts ""
    end

    def display_one_vegetable(input)
        @scraper.scrape_vegetable(input)
        Vegetable.display_one(input)
    end


    def escit
        banner =
        "                                                    ::::::::   ::::::::   ::::::::  :::::::::       :::::::::  :::   ::: :::::::::: ::: 
                                                   :+:    :+: :+:    :+: :+:    :+: :+:    :+:      :+:    :+: :+:   :+: :+:        :+: 
                                                   +:+        +:+    +:+ +:+    +:+ +:+    +:+      +:+    +:+  +:+ +:+  +:+        +:+ 
                                                   :#:        +#+    +:+ +#+    +:+ +#+    +:+      +#++:++#+    +#++:   +#++:++#   +#+ 
                                                   +#+   +#+# +#+    +#+ +#+    +#+ +#+    +#+      +#+    +#+    +#+    +#+        +#+ 
                                                   #+#    #+# #+#    #+# #+#    #+# #+#    #+#      #+#    #+#    #+#    #+#            
                                                    ########   ########   ########  #########       #########     ###    ########## ### "
         puts banner.green
    end

end