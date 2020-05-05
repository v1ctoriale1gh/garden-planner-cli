class Vegetable
    attr_accessor :name, :url, :planting_dates

    def initialize(name, url, planting_dates)
        @name= name
        @url= url
        @planting_dates= planting_dates
    end

    #mass assign more attributes from withing second level scraping

end