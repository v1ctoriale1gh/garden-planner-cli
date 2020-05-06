
require 'nokogiri'
require 'pry'
require 'open-uri'


class Scraper

    attr_accessor :url, :secondUrl, :last_frost, :scraped_vegetable

    def initialize(url)
        ######First level scrape- interpolated  user.location into URL in user class####
        @url= url
        html = open(url)
        doc = Nokogiri::HTML(html)
        @last_frost= doc.css("caption").text
        doc.css(".plantrow").each do |element|
            
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
        
    def scrape_vegetable(third_input)
        #######second level scrape - imake individual veggie url ############
        ######green beans url is the one exception to how the url is written#######
        ##### Website fails if you iterate over each vegetable#######
        ##### Mass assigns vegetable attributes to the vegetable chosen by the user#####
        formatted_input = third_input.split.map {|word| word.capitalize}.join(' ')
        veg = Vegetable.all.detect {|vegetable| vegetable.name == formatted_input}
        if veg.name == "Green Beans"
            secondUrl = "https://www.almanac.com/plant/beans"
        else
            secondUrl = "https://www.almanac.com/plant/#{veg.name.gsub(" ", "-")}"
        end

        html = open(secondUrl)
        doc = Nokogiri::HTML(html)
        #binding.pry
        @scraped_vegetable_hash = {}
        @scraped_vegetable_hash[:bio] = doc.css("div.field-item.even").children[5..10].text.gsub("\n", " ")
        @scraped_vegetable_hash[:picture] = doc.css("span.field-content").children[0].attribute("src").value
        if doc.css("td.views-field.views-field-field-sun-exposure-term.views-column-odd.views-column-first.views-column-last").text.strip != ""
            @scraped_vegetable_hash[:sun] = "Sun pref: #{doc.css("td.views-field.views-field-field-sun-exposure-term.views-column-odd.views-column-first.views-column-last").text.strip}"
        end
        if doc.css("td.views-field.views-field-field-soil-type-term.views-column-odd.views-column-first.views-column-last").text.strip != ""
            @scraped_vegetable_hash[:soil_type] = "Soil type: #{doc.css("td.views-field.views-field-field-soil-type-term.views-column-odd.views-column-first.views-column-last").text.strip}"
        end
        if  doc.css("td.views-field.views-field-field-soil-ph-term.views-column-odd.views-column-first.views-column-last").text.strip != ""
            @scraped_vegetable_hash[:soil_ph] = "Soil PH: #{doc.css("td.views-field.views-field-field-soil-ph-term.views-column-odd.views-column-first.views-column-last").text.strip}"
        end
        if doc.css("td.views-field.views-field-field-bloom-time-term.views-column-odd.views-column-first.views-column-last").text.strip != ""
            @scraped_vegetable_hash[:bloom] = "Bloom Time:  #{doc.css("td.views-field.views-field-field-bloom-time-term.views-column-odd.views-column-first.views-column-last").text.strip}"
        end

        veg.more_attributes(@scraped_vegetable_hash)
        #binding.pry
        
    end

end

