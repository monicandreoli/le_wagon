# interface.rb

# INPUT: 2 numbers(integers), operator(string "-", "+")
# PSEUDOCODE FOR THE CODE TO BUILD
    # 0. Say hello to the user
    # 1.A message to ask the user a first integer
      # save it into a variable
    # 2.A message to ask the user a second integer
      # save it into a variable
    # 3.A message to ask the user an operator
      # save it into a variable
    # 4. A method to do the calculation.
        # 4 case scenarios/conditions
          # sum
          # subtraction
          # division
          # multiplication
          # if my user is giving me a + operator (comparison in ruby is with ==)
          #   sum the first_number and the second_number
          # elsif my user is giving me a - operator:
          #   ...
    # 5.Display the result to the user


# OUTPUT: 1 integer or a float

# puts "Hello user!"
# puts "> Enter a first number:"
# first_number = gets.chomp.to_i

# puts "> Enter a second one:"
# second_number = gets.chomp.to_i

# puts "> Choose operation [+][-][*][/]"
# operator = gets.chomp

# if operator == "+"
#   result = first_number + second_number
# elsif operator == "-"
#   result = first_number - second_number
# elsif operator == "/"
#   result = first_number / second_number
# elsif perator == "*"
#   result = first_number * second_number
# else
#   puts "Type an operator that exists"
# end

# puts "> Result: #{result}"

# case operator
# when "+"
#   result = first_number + second_number
# when "-"
#   result = first_number - second_number
# when "/"
#   result = first_number / second_number
# when "*"
#   result = first_number * second_number
# else
#   puts "Type an operator that exists"
# end



 # SECOND STEP
 # pb: relaunch the program all the time. annoying
 # while loop/until loop

# > Do you want to calculate again? [Y/N]
# > N

# Make our program with the if/elsif conditionals loop while the user is not saying "N"
# we need to compare the user_wish to a string "Y" or "N"
    # declare the variable user_wish so i don't get an undefined variable
    #while the user_wish is not "N"
      # if
      # elsif
      #   ...
      # do you want to play again?
        #save into a variable the user_wish


require_relative 'calculator'

# puts "Hello user!"
# user_wish = ""
# while user_wish != "N"
# # until user_wish == "N"
#   puts "> Enter a first number:"
#   first_number = gets.chomp.to_i

#   puts "> Enter a second one:"
#   second_number = gets.chomp.to_i

#   puts "> Choose operation [+][-][*][/]"
#   operator = gets.chomp

#   if operator == "+"
#     result = first_number + second_number
#   elsif operator == "-"
#     result = first_number - second_number
#   elsif operator == "/"
#     result = first_number / second_number
#   elsif perator == "*"
#     result = first_number * second_number
#   else
#     puts "Type an operator that exists"
#   end
#   puts "> Result: #{result}"
#   puts "do you want to play again? Type N to quit the program"
#   user_wish = gets.chomp
# end

# puts "Thank you for playing, bye!"



# THIRD STEP: REFACTORING OUR CODE
  # extract in the method in a file called calculator.rb
  # refactoring the interface too

require_relative 'calculator' #importing the method from calculator.rb inside of the interface.rb
# require_relative: require a file and the code inside of this file
#  require 'date': require the code of a library/gem that is located inside of the ruby version that is installed inside of your computer.

puts "Hello user!"
user_wish = ""
while user_wish != "N"
# until user_wish == "N"
  puts "> Enter a first number:"
  first_number = gets.chomp.to_i

  puts "> Enter a second one:"
  second_number = gets.chomp.to_i

  puts "> Choose operation [+][-][*][/]"
  operator = gets.chomp
  my_result = calculate(first_number, second_number, operator)
  puts "> Result: #{my_result}"
  puts "do you want to play again? Type N to quit the program"
  user_wish = gets.chomp
end

puts "Thank you for playing, bye!"









