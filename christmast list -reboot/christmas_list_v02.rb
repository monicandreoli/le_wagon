# Step 2 - List, Add, Delete
# 1.modelizing our christmas_list:
# christmas_list = ['surfboard', 'rollers'] #list of our gifts
# 2.List action:
#   print the array christmas_list => each
# 3.Add action: add an item to the chritmas list (READ the elements in an array)
#   Ask the user what he wants to add
#   save the item_wish into a variable
#   push that variable in our christmas_array. (ADD an element in an array)
# 4. Delete action:  delete an item_wish from the christmas list
#   Ask the user which item he wants to delete
#   Save the item_wish_to_delete into a variable
#   name_array.delete(item_wish_to_delete)

christmas_list = ['surfboard', 'rollers']

puts "> Welcome to your Christmas gift list"
user_action = ""

def list(christmas_list)
  christmas_list.each do | gift|
      "> #{gift}"
  end
end

while user_action != "quit"
  puts "> Which action [list|add|delete|quit]?"
  user_action = gets.chomp.downcase
  case user_action
  when "list"
      puts list(christmas_list)
  when "add"
    puts "What would you like to add ?"
    wish_to_add = gets.chomp
    christmas_list << wish_to_add
  when "delete"
    puts "What would you like to delete?"
    puts list(christmas_list)
    wish_to_delete = gets.chomp
    christmas_list.delete(wish_to_delete)
  else
    puts "Type an action that exists" unless user_action == "quit"
  end
end

puts "Goodbye!"
