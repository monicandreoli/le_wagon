require 'csv'

# TODO - let's read/write data from beers.csv
# PARSING CSV : foreach. going from data format/text to ruby object
filepath    = 'data/beers.csv'

# csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
# # beers_array = []
# CSV.foreach(filepath, csv_options) do |row|
#   # Here, row is an array of columns
#   # puts "#{row[0].class} | #{row[1]} | #{row[2]}"
#   puts "#{row['Name']}, a #{row['Appearance']} beer from #{row['Origin']}"
#   # beers_array << row[0]
# end

# puts beers_array
# tips: always check it
# puts beers_array.class


# STORING CSV : open. going from ruby objects to data format/text
csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

#wb stands for write binary, it erases everything and saves everything again.
CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['Name', 'Appearance', 'Origin'] #first row is the headers
  csv << ['Asahi', 'Pale Lager', 'Japan']
  csv << ['Guinness', 'Stout', 'Ireland']
end
