class Vegetable
    attr_accessor :name, :url, :planting_date, :number, :bio, :picture, :sun, :soil_type, :soil_ph, :bloom
    @@all = []

    def initialize(name, url, planting_date= nil)
        @planting_date= planting_date
        @name= name
        @url= url
        save
    end

    def save
        if self.planting_date != nil  && self.name != "Cilantro (Coriander)"
        @@all << self 
        end
    end

    def self.all
        @@all
    end

    def self.display_vegetables
        if @@all.length == 15
            puts "                                                            #{@@all[0].name}       ||   #{@@all[1].name}    ||     #{@@all[2].name} ".green    
            puts ""
            puts "                                                            #{@@all[3].name}        ||    #{@@all[4].name}      ||     #{@@all[5].name} ".magenta
            puts ""
            puts "                                                            #{@@all[6].name}        ||    #{@@all[7].name}    ||     #{@@all[8].name} ".light_blue
            puts ""     
            puts "                                                            #{@@all[9].name}    ||    #{@@all[10].name}      ||     #{@@all[11].name} ".magenta
            puts ""
            puts "                                                            #{@@all[12].name}    ||   #{@@all[13].name}    ||     #{@@all[14].name} ".green
        else    
            Vegetable.all.each {|vegetable| puts "#{vegetable.name}".green}
        end
    end


    def self.find_by_input(input)
        formatted_input = input.split.map {|word| word.capitalize}.join(' ')
        veg = Vegetable.all.detect {|vegetable| vegetable.name == formatted_input}
        veg
    end

    def self.display_one(input)
        formatted_input = input.split.map {|word| word.capitalize}.join(' ')
        veg = Vegetable.all.detect {|vegetable| vegetable.name == formatted_input}

        attribute_array = []
        if veg.sun != nil
            attribute_array << veg.sun
        end
        if veg.soil_ph != nil
            attribute_array << veg.soil_ph
        end
        if veg.soil_type != nil
            attribute_array << veg.soil_type
        end
        if veg.bloom != nil
            attribute_array << veg.bloom
        end

        puts "                                      #{veg.name}".magenta
        puts ""
        puts "#{veg.bio}".green
        puts ""


        if attribute_array.length == 1
            puts "                                                                              #{attribute_array[0]}".magenta
        elsif attribute_array.length == 2
            puts "                                                                   #{attribute_array[0]} || #{attribute_array[1]}".magenta
        elsif attribute_array.length == 3
            puts "                                                  #{attribute_array[0]} || #{attribute_array[1]} || #{attribute_array[2]}".magenta  
        elsif attribute_array.length == 4
            puts "                                  #{attribute_array[0]} || #{attribute_array[1]} || #{attribute_array[2]} || #{attribute_array[3]}".magenta
        end

        puts ""
        puts ""
        puts "                                                                          Do you want to add #{self.name} to your vegetable garden?
                                                                                                                    (Yes or No)"
        input = gets.chomp
        if input.capitalize == "Yes"
            User.add_vegetable(veg)
        puts "                                                                          #{veg.name} has been added to your Garden!".green
        puts ""
        puts ""
        puts "                       =====Go back type B || Add #{veg.name} to your vegetable garden type A || See your garden type garden|| EXIT type C=====".magenta 
        else

        puts ""
        puts ""
        puts "                       =====Go back type B || Add #{veg.name} to your vegetable garden type A || See your garden type garden || EXIT type C=====".magenta 
        puts ""
        puts ""
        end
    end


    def more_attributes(attributes)
        attributes.each{|key, value| self.send(("#{key}="), value )}
    end

end