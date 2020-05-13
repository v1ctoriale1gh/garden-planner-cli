

class User
    attr_accessor :name, :city, :state, :location, :location_html, :vegetable_garden
    @@all = []
    @@vegetable_garden = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def set_location(input)
        city, state = input.split(", ")
        @city= "#{city.capitalize}"
        @state= "#{state.upcase}"
        @location= "#{city.capitalize}, #{state.upcase}"
    end

    def create_location_html
        @location_html=  "https://www.almanac.com/gardening/planting-calendar/#{@state}/#{@city.gsub(" ", "%20")}"
    end

    def self.add_vegetable(vegetable)
         if @@vegetable_garden.length < 8
            vegetable.user = self
            @@vegetable_garden << vegetable
        end
    end
    
    def self.display_garden
        garden_banner= 
        "                                    :::   :::  ::::::::  :::    ::: :::::::::        ::::::::      :::     :::::::::  :::::::::  :::::::::: ::::    ::: 
                                    :+:   :+: :+:    :+: :+:    :+: :+:    :+:      :+:    :+:   :+: :+:   :+:    :+: :+:    :+: :+:        :+:+:   :+: 
                                     +:+ +:+  +:+    +:+ +:+    +:+ +:+    +:+      +:+         +:+   +:+  +:+    +:+ +:+    +:+ +:+        :+:+:+  +:+ 
                                      +#++:   +#+    +:+ +#+    +:+ +#++:++#:       :#:        +#++:++#++: +#++:++#:  +#+    +:+ +#++:++#   +#+ +:+ +#+ 
                                       +#+    +#+    +#+ +#+    +#+ +#+    +#+      +#+   +#+# +#+     +#+ +#+    +#+ +#+    +#+ +#+        +#+  +#+#+# 
                                       #+#    #+#    #+# #+#    #+# #+#    #+#      #+#    #+# #+#     #+# #+#    #+# #+#    #+# #+#        #+#   #+#+# 
                                       ###     ########   ########  ###    ###       ########  ###     ### ###    ### #########  ########## ###    #### "

        puts garden_banner.green
        puts ""
        puts ""
        puts ""
        puts ""
        if @@vegetable_garden.length == 0
            puts "                                                         Sorry! You haven't added any vegetables yet!".green
            puts ""
            puts "                                                            =====Go back type B || EXIT type C=====".magenta
        elsif @@vegetable_garden.length == 1
            puts "                                         #{@@vegetable_garden[0].name}              || Empty Planting Space || Empty Planting Space ||  Empty Planting Space".green
            puts "                                         Empty Planting Space || Empty Planting Space || Empty Planting Space ||  Empty Planting Space".green
            puts ""  
            puts "                                       =====Go back type B || To display more type vegetable name || EXIT type C=====".magenta
        elsif @@vegetable_garden.length == 2
            puts "                                         #{@@vegetable_garden[0].name}              || #{@@vegetable_garden[1].name}               || Empty Planting Space ||  Empty Planting Space".green
            puts "                                         Empty Planting Space || Empty Planting Space || Empty Planting Space ||  Empty Planting Space".green  
            puts ""
            puts "                                       =====Go back type B || To display more type vegetable name || EXIT type C=====".magenta
        elsif @@vegetable_garden.length == 3
            puts "                                         #{@@vegetable_garden[0].name}            ||  #{@@vegetable_garden[1].name}              || #{@@vegetable_garden[2].name}               ||  Empty Planting Space".green
            puts "                                         Empty Planting Space || Empty Planting Space || Empty Planting Space ||  Empty Planting Space".green  
            puts ""
            puts "                                       =====Go back type B || To display more type vegetable name || EXIT type C=====".magenta
        elsif @@vegetable_garden.length == 4
            puts "                                        #{@@vegetable_garden[0].name}            ||  #{@@vegetable_garden[1].name}              || #{@@vegetable_garden[2].name}              ||  #{@@vegetable_garden[3].name}".green
            puts "                                        Empty Planting Space || Empty Planting Space || Empty Planting Space ||  Empty Planting Space".green  
            puts ""
            puts "                                       =====Go back type B || To display more type vegetable name || EXIT type C=====".magenta
        elsif @@vegetable_garden.length == 5
            puts "                                        #{@@vegetable_garden[0].name}             ||  #{@@vegetable_garden[1].name}              || #{@@vegetable_garden[2].name}               ||  #{@@vegetable_garden[3].name}".green
            puts "                                        #{@@vegetable_garden[4].name}             || Empty Planting Space || Empty Planting Space ||  Empty Planting Space".green
            puts ""
            puts "                                       =====Go back type B || To display more type vegetable name || EXIT type C=====".magenta
        elsif @@vegetable_garden.length == 6
            puts "                                       #{@@vegetable_garden[0].name}             ||  #{@@vegetable_garden[1].name}             || #{@@vegetable_garden[2].name}               ||  #{@@vegetable_garden[3].name}".green
            puts "                                       #{@@vegetable_garden[4].name}             ||  #{@@vegetable_garden[5].name}               || Empty Planting Space ||  Empty Planting Space".green
            puts ""
            puts "                                       =====Go back type B || To display more type vegetable name || EXIT type C=====".magenta      
        elsif @@vegetable_garden.length == 7
            puts "                                        #{@@vegetable_garden[0].name}             ||  #{@@vegetable_garden[1].name}              || #{@@vegetable_garden[2].name}               ||  #{@@vegetable_garden[3].name}".green
            puts "                                        #{@@vegetable_garden[4].name}             ||  #{@@vegetable_garden[5].name}              || #{@@vegetable_garden[6].name}      ||  Empty Planting Space".green
            puts ""
            puts "                                       =====Go back type B || To display more type vegetable name || EXIT type C=====".magenta 
        elsif @@vegetable_garden.length == 8
            puts "                                        #{@@vegetable_garden[0].name}             ||  #{@@vegetable_garden[1].name}              || #{@@vegetable_garden[2].name}               ||  #{@@vegetable_garden[3].name}".green
            puts "                                        #{@@vegetable_garden[4].name}             ||  #{@@vegetable_garden[5].name}              || #{@@vegetable_garden[6].name}               ||  #{@@vegetable_garden[6].name}".green
            puts ""
            puts "                                       =====Go back type B || To display more type vegetable name || EXIT type C=====".magenta           
        end
    end


    def self.clear_garden
        @@vegetable_garden.clear
    end

end



