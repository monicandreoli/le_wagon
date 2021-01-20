require 'open-uri' # this is already within ruby
require 'nokogiri' #bunch of code/library of code of ruby/ package/gem
                  # need to install locally by running gem install
require 'csv'

christmas_list = {
  # key => value
  'surfboard' => false, #status by default
  'rollers' => true,
}


# PARSING
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = 'gifts.csv'

CSV.foreach(filepath, csv_options) do |row|
  # TODO: build new gift from information stored in each row
  # we're convertting the status string as a boolean status.
  if row[1] == "true"
    row[1] = true
  else
    row[1] = false
  end
  christmas_list[row[0]] = row[1]
end


puts "> Welcome to your Christmas gift list"
user_action = ""

def list(christmas_list)
  christmas_list.keys.each_with_index do | gift, index|
    status = christmas_list[gift] ? "[X]" : "[]"
    puts "> #{index + 1} - #{status} #{gift}"
  end
end

while user_action != "quit"
  puts "> Which action [list|add|delete|quit|mark|idea]?"
  user_action = gets.chomp.downcase
  case user_action
  when "list"
    list(christmas_list)
  when "add"
    puts "What would you like to add ?"
    wish_to_add = gets.chomp
    christmas_list[wish_to_add] = false
  when "delete"
    puts "What would you like to delete? Please give a number"
    list(christmas_list)
    index_wish_to_delete = gets.chomp.to_i - 1
  when "mark"
    puts "Which item did you buy/want to mark ?"
    list(christmas_list)
    index_gift_to_mark = gets.chomp.to_i - 1
    gift_to_mark = christmas_list.keys[index_gift_to_mark]
  when "idea"
    puts "what do you want to look for on etsy?"
    user_idea = gets.chomp
    puts "You chose to get some inspiration for #{user_idea}"
    ###### SCRAPING MAGIC
    # 1. We get the HTML page content thanks to open-uri
    html_string = open("https://www.etsy.com/search?q=#{user_idea}").read
    # puts html_string

    # 2. We build a Nokogiri document from this file
    nokogiri_doc = Nokogiri::HTML(html_string)
    # puts doc.class
    etsy_results_array = []
    # 3. We search for the correct elements containing the items' title in our HTML nokogiri doc
    nokogiri_doc.search('.text-gray.text-truncate.mb-xs-0.text-body').each do |element|
      # 4. For each item found, we extract its title and print it
      etsy_results_array << element.text.strip
      # text : removes the html content code
      # strip : removes the empty space at the beginning and at the end.
    end
    # 2. Once we get results from scraping the user_idea we should display all of them inside of an array.
      #2.1 puts "Here are Etsy results for user_idea:
    puts "Here are Etsy results for #{user_idea}:"
      #2.2 each_with_index to display the results
    etsy_results_array.each_with_index do |item, index|
      puts "#{index + 1} - #{item}"
    end

    # 3. ask the user "Pick one to add to your list (give the number)"
    puts "Pick one to add to your list (give the number)"
        # 3.1 save the user_choice inside of a variable(integer)
    index_user_choice = gets.chomp.to_i - 1
        # 3.2 Add the user_choice to the christmas list
    user_choice = etsy_results_array[index_user_choice]
    christmas_list[user_choice] = false

  else
    puts "Type an action that exists" unless user_action == "quit"
  end
end

puts "Saving to the csv .. wait a minute"

csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

CSV.open(filepath, 'wb', csv_options) do |csv|
  # We had headers to the CSV
  csv << ['name', 'status'] #pushing the headers
  #TODO: store each gift
  christmas_list.each do |key, value|
    csv << [key, value]
  end
end


puts "Goodbye!"
