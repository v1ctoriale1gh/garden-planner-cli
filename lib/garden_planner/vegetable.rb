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
        @@all.each_with_index {|vegetable, index| puts "#{index+1}  #{vegetable.name}"}
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

        puts "                                      #{veg.name}"
        puts ""
        puts "#{veg.bio}"
        puts ""


        if attribute_array.length == 1
            puts "                              #{attribute_array[0]}"
        elsif attribute_array.length == 2
            puts "                  #{attribute_array[0]} || #{attribute_array[1]}"
        elsif attribute_array.length == 3
            puts "        #{attribute_array[0]} || #{attribute_array[1]} || #{attribute_array[2]}"  
        elsif attribute_array.length == 4
            puts "#{attribute_array[0]} || #{attribute_array[1]} || #{attribute_array[2]} || #{attribute_array[3]}"
        end


        puts ""
        puts ""
        puts "   =====Go back type B || Add #{veg.name} to your vegetable garden type A || EXIT type C=====" 
        puts ""
        puts ""
    end


    def more_attributes(attributes)
        attributes.each{|key, value| self.send(("#{key}="), value )}
    end
    #mass assign more attributes from withing second level scraping

end