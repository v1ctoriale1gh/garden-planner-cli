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
        #search for correct format with regex, puts error incorrect location
        city, state = input.split(", ")
        @city= "#{city.capitalize}"
        @state= "#{state.upcase}"
        @location= "#{city.capitalize}, #{state.upcase}"
    end

    def create_location_html
        @location_html=  "https://www.almanac.com/gardening/planting-calendar/#{@state}/#{@city.gsub(" ", "%20")}"
    end

    def self.add_vegetable(vegetable)
         if !@@vegetable_garden.include?(vegetable)
            @@vegetable_garden << vegetable
        end
    end
    
    def self.display_garden
        if @@vegetable_garden.length == nil
            puts "                                                                    Sorry! You haven't added any vegetables yet!".green
        else
            @@vegetable_garden.each {|vegetable| puts "#{vegetable.name}".green}
        end
    end


    def self.clear_garden
        @@vegetable_garden.clear
    end

end



