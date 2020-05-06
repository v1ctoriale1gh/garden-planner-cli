
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
        
    def scrape_vegetable(third_input)
            #######second level scrape - imake individual veggie url ############
            ######(green beans url is the one exception to how the url is written#######
            ##### Website fails if you iterate over each vegetable#######
            ##### Mass assigns vegetable attributes to the vegetable chosen by the user#####
        veg = Vegetable.all.detect {|vegetable| vegetable.name == third_input.capitalize}
            if veg.name == "Green Beans"
                secondUrl = "https://www.almanac.com/plant/beans"
            else
                secondUrl = "https://www.almanac.com/plant/#{veg.name.gsub(" ", "-")}"
            end
    
            html = open(secondUrl)
            doc = Nokogiri::HTML(html)
            #binding.pry
            @scraped_vegetable_hash = {}
            @scraped_vegetable_hash[:bio] = doc.css("div.field-item.even").children[5..10].text
            @scraped_vegetable_hash[:picture] = doc.css("span.field-content").children[0].attribute("src").value
            if doc.css("td.views-field.views-field-field-sun-exposure-term.views-column-odd.views-column-first.views-column-last").text.strip != ""
                @scraped_vegetable_hash[:sun] = doc.css("td.views-field.views-field-field-sun-exposure-term.views-column-odd.views-column-first.views-column-last").text.strip
            end
            if doc.css("td.views-field.views-field-field-soil-type-term.views-column-odd.views-column-first.views-column-last").text.strip != ""
                @scraped_vegetable_hash[:soil_type] = doc.css("td.views-field.views-field-field-soil-type-term.views-column-odd.views-column-first.views-column-last").text.strip
            end
            if  doc.css("td.views-field.views-field-field-soil-ph-term.views-column-odd.views-column-first.views-column-last").text.strip != ""
                @scraped_vegetable_hash[:soil_ph] = doc.css("td.views-field.views-field-field-soil-ph-term.views-column-odd.views-column-first.views-column-last").text.strip
            end
            if doc.css("td.views-field.views-field-field-bloom-time-term.views-column-odd.views-column-first.views-column-last").text.strip != ""
                @scraped_vegetable_hash[:bloom] = doc.css("td.views-field.views-field-field-bloom-time-term.views-column-odd.views-column-first.views-column-last").text.strip
            end

            veg.more_attributes(@scraped_vegetable_hash)
            binding.pry
        
        
    end

    ### DILL BIO  doc.css("div.field-item.even").children[5..10].text----- Each ones length slightly varies 
    ########TECHNICAL QUESTION HOW TO GET RID OF \n###########

    #### PICTURE doc.css("span.field-content").children[0].attribute("src").value
    #### sun = doc.css("td.views-field.views-field-field-sun-exposure-term.views-column-odd.views-column-first.views-column-last").text.strip
    #### soil_type = doc.css("td.views-field.views-field-field-soil-type-term.views-column-odd.views-column-first.views-column-last").text.strip
    ###### soil_ph = doc.css("td.views-field.views-field-field-soil-ph-term.views-column-odd.views-column-first.views-column-last").text.strip

    #if .text.strip != ""
    #bloom = doc.css("td.views-field.views-field-field-bloom-time-term.views-column-odd.views-column-first.views-column-last").text.strip
    

end

