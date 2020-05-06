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
        if self.planting_date != nil
        @@all << self 
        end
    end

    def self.all
        @@all
    end

    def self.display_vegetables
        @@all.each_with_index {|vegetable, index| puts "#{index+1}  #{vegetable.name}"}
    end


    def more_attributes(attributes)
        attributes.each{|key, value| self.send(("#{key}="), value )}
    end
    #mass assign more attributes from withing second level scraping

end