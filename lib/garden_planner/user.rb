class User
    attr_accessor :name, :city, :state, :location, :location_html, :vegetable_garden
    @@all = []

    def initialize(name)
        @name = name
        save
        @vegetable_garden = []
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def set_location(input)
        #search for correct format with regex, puts error incorrect location
        #if a space, add %20 in the space use gsub
        city, state = input.split(", ")
        @city= "#{city.capitalize}"
        @state= "#{state.upcase}"
        @location= "#{city.capitalize}, #{state.upcase}"
    end

    def create_location_html
        @location_html=  "https://www.almanac.com/gardening/planting-calendar/#{@state}/#{@city}"
    end

    #def add_vegetable(vegetable)
         #if !vegetable_garden.include?(vegetable)
            #@vegetable_garden << vegetable
        #end
    #end

    def clear_garden
        @vegetable_garden.clear
    end

    def display_garden
        @vegetable_garden.each {|vegetable| vegetable.name}
    end

end



