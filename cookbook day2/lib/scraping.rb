require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class ScrapingServiceObject

  #scraping the information, dynamicall with the keyword of the user
  def initialize(keyword_inspiration)
    @keyword_inspiration = keyword_inspiration
  end

  # instance methods
  def scraping_time_woop_woop
    url = "https://www.marmiton.org/recettes/recherche.aspx?aqt=#{@keyword_inspiration}"

    html_doc = open(url).read

    nokogiri_doc = Nokogiri::HTML(html_doc, nil, 'utf-8')
    # 3.Parse the HTML document to extract the first 5 recipes suggested and store them in an Array(scraping logic + using the model)
    recipes_array_from_scraping = []
    nokogiri_doc.search('.recipe-card').first(5).each do |card_element|
      # name
      name = card_element.search('.recipe-card__title').text
      # description
      description = card_element.search('.recipe-card__description').text.strip
      # I need to build a recipe object with the title and description that i get from the scraping
      recipes_array_from_scraping << Recipe.new({name: name, description: description})
    end

    recipes_array_from_scraping #last line of the method is the one getting returned
  end

end
