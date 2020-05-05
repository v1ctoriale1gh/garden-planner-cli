class Vegetable
    attr_accessor :name, :url, :planting_dates, :number
    @@all = []

    def initialize(name, url, inside_planting = nil, outside_planting = nil)
        @planting_dates= []
        @name= name
        @url= url
        #IF INSIDE AND OUTSIDE BOTH EXIST ELSIF ONLY ONE EXIST ESLE IF THE OTHER EXIST
       # @planting_dates << inside_planting && outside_planting
       save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.display_vegetables
        @@all.each_with_index {|vegetable, index| puts "#{index+1}  #{vegetable.name}"}
    end


    
    #mass assign more attributes from withing second level scraping

end