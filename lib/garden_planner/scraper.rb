
require 'nokogiri'
require 'pry'
require 'open-uri'


class Scraper

    attr_accessor :url, :secondUrl, :last_frost, :scraped_vegetable

    def initialize(url)
        @url= url
        html = open(url)
        doc = Nokogiri::HTML(html)
        #binding.pry
        @last_frost= doc.css("caption").text
        doc.css(".plantrow").each do |element|
            #binding.pry
            name = element.children[0].text
            url = element.children[0].children[0].attribute("href").value
            if element.children[3].text == "N/A"
                veg = Vegetable.new(name, url)
            else
                planting_date = element.children[3].children[1].text
                veg = Vegetable.new(name, url, planting_date)
            end 
        end
    end

    

    def scrape_individual_vegetable(third_input)
        vegetable = Vegetable.all.detect {|vegetable| vegetable.name == third_input}
        @secondUrl = "https://www.almanac.com/plant/#{vegetable.name.gsub(" ", "-")}"
        
        html = open(url)
        doc = Nokogiri::HTML(html)
        #binding.pry
        @scraped_vegetable = {}

        @scraped_vegetable[:bio] = "this is a fake test bio"
        @scraped_vegetable[:picture] = "this is a picture url"
        @scraped_vegetable[:sun] = "this veggie likes full sun"
        @scraped_vegetable[:soil_type] = "barky"
        @scraped_vegetable[:soil_ph] = "7.6"
        @scraped_vegetable[:bloom] = "blooms at that time right before it gets hot af"

        vegetable.more_attributes(@scraped_vegetable)
        #binding.pry
        puts "#{vegetable.name}"
    end
    #second level scrape for mass assignment of vegetable attribute

end


