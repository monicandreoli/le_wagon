# STEP 01:

  # 1.print to the user welcome to the christmas program
  # 2. ask the user what action he wants to do: list,add, delete, quit
  # 3. save the user action in a variable using gets.chomp
  # 4. case statement/ if else statement for what each user action
       # 4 conditions: list, add, delete, quit(quit the loop)
  # 5. Build the loop: while user_action != 'quit' / until user_action == "quit"
  # 6. print goodbye to the user


puts "> Welcome to your Christmas gift list"
user_action = ""

while user_action != "quit"
  puts "> Which action [list|add|delete|quit]?"
  user_action = gets.chomp.downcase
  case user_action
  when "list"
    puts "TODO: list items"
  when "add"
    puts "TODO: add an item"
  when "delete"
    puts "TODO: delete an item"
  else
    puts "Type an action that exists" unless user_action == "quit"
  end
end

puts "Goodbye!"


