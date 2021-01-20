require 'open-uri'
require 'nokogiri' # the class that helps me scrape things from a website.

# Let's scrape chocolate recipes from http://www.epicurious.com
# Easy chocolate fudge cake


# 1. get the url of the website i want to scrape
url = "https://www.bbcgoodfood.com/search/recipes?q=chocolate"
#.2 open the url and read it
html_file = open(url).read
# puts html_file
# puts html_file.class
# 3. I need to find the css element where the info that i want is.
  # 3.1 To find my css element where the titles of my chocolate recipes are I need to use NOKOGIRI
    nokogiri_doc = Nokogiri::HTML(html_file)
    # puts nokogiri_doc
    # puts nokogiri_doc.class
    # nokogiri element is an object that you can use to scrape.
    #it contains a bunch of built-in methods that gives you access to the content/text of the tags of the website
  #3.2
    # now i'm able to scrape for real thanks to my nokogiri object
    # css_selector: classes, ids, tags
    # nokogiri_doc.search('.class-name')
    # nokogiri_doc.search('#id-name')
    # nokogiri_doc.search('tag-name')

    nokogiri_array = nokogiri_doc.search('.standard-card-new__article-title')
    chocolate_recipes = []
    nokogiri_array.each do |title|
      chocolate_recipes << title.text
    end



    chocolate_recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe}"
    end
