require 'json'

# TODO - let's read/write data from beers.json
filepath    = 'data/beers.json'

#beginning of program
#PARSING JSON

#2. steps in parsing json: you should always get back a ruby hash.
  #1.Read the file
  json_file = File.read(filepath)
  puts json_file.class # it's a string.
  #2. I want to get back a ruby object for my program
  ruby_hash = JSON.parse(json_file)
  puts ruby_hash
  puts ruby_hash.class


# CODE
# adding stuff to my ruby_hash

#end of program
# STORING JSON

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(ruby_hash))
end
