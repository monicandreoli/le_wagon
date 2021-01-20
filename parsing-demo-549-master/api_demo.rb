require 'json' #
require 'open-uri' #opening an url and reading it. It's a ruby package.

# TODO - Let's fetch name and bio from a given GitHub username

#I have a program where i'd like to display the infos of github of whoever i want

# 1. declare your url
url = 'https://api.github.com/users/ssaunier'
# 2.open the url
json_string = open(url).read
# puts json_string
# puts json_string.class
#3. parsing the json_string into a ruby hash object
github_hash = JSON.parse(json_string)
# p github_hash

github_hash.each do |key, value|
  p "#{key} - #{value}"
end
# puts github_hash.class

puts "#{github_hash["name"]} is staying in #{github_hash['location']} and he is #{github_hash['bio']}"
