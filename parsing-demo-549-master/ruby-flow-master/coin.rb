options = ['heads', 'tails']
result = options.sample

puts "Guess the coin flip result"
user_guess = gets.chomp

verb = user_guess == result ? 'won' : 'lost'

puts "You #{verb}"
