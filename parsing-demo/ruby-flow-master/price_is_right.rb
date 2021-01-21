number = rand(5) + 1

user_guess = nil

while number != user_guess
  puts "Guess a number"
  user_guess = gets.chomp.to_i
end

puts "You guessed!"
