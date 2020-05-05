
require 'nokogiri'
require 'pry'
require 'open-uri'


class Scraper

    attr_accessor :url

    def initialize(url)
        @url= url
        html = open(url)
        doc = Nokogiri::HTML(html)
        binding.pry
        doc.css("div block-system-main").each do |element|
            element.css("tr.plantrow").each do |vegetable|
                binding.pry
                name = doc.css("tr.plantrow a").first.children.text
                url = doc.css("tr.plantrow a").first.attribute("href").value
                #planting_dates = [inside: => "", outside: => ""]
                veg = Vegetable.new(name, url)
            end
        end
    end

    #second level scrape for mass assignment of vegetable attribute

end


