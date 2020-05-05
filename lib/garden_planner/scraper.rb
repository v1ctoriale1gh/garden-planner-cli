
require 'nokogiri'
require 'pry'
require 'open-uri'


class Scraper

    attr_accessor :url, :secondUrl

    def initialize(url)
        @url= url
        html = open(url)
        doc = Nokogiri::HTML(html)
        #binding.pry
        doc.css(".plantrow").each do |element|
            #binding.pry
            name = element.children[0].text
            url = element.children[0].children[0].attribute("href").value
            veg = Vegetable.new(name, url,) # inside_planting, outside_planting)
        end
    end

    def make_second_layer_url(third_input)
        vegetable = Vegetable.all.detect {|vegetable| vegetable.name == third_input}
        @secondUrl = vegetable.url
        puts "#{secondUrl}"
    end
    #second level scrape for mass assignment of vegetable attribute

end


