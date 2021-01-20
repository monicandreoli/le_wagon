# Step 3 - Mark an item as bought

# 1.Modify the christmas_list modelisation
  # list the christmas_list
  # use each_with_index to display the christmas_list that is now a hash.
    # christmas_list = {
    #   # product_name => status
    #   'surfboard' => false,
    #   'rollers' => false,
    # }
  # if status == true(true represent/modelise that the gift is bought)
    # [X]
  #else (the gift not bought)
    #[]
  #end
# 2. Add an other action in the string ""> Which action [list|add|delete|mark|quit]?
#     write a case:  when "mark"
#     ask the user Which item have you bought (give the index)?
#     index_item_to_delete = gets.chomp.to_i  (substrac one when we use it because we display index + 1 in the each_with_index)
#     modify the status to true:
#     name_of_the_hash[key_name] = new_value (update a key value pair in a hash)
# Add:
  # not anymore adding an item to an array but we're adding an item to a hash.
  # name_of_the_hash[key_name] = value

#delete
  # not anymore deleting an item to an array but we're adding an item to a hash.
  # name_of_the_hash.delete(key_name)

christmas_list = {
  # key => value
  'surfboard' => false, #status by default
  'rollers' => true,
}

puts "> Welcome to your Christmas gift list"
user_action = ""

def list(christmas_list)
  christmas_list.keys.each_with_index do | gift, index|
    status = christmas_list[gift] ? "[X]" : "[]"
    #     status    = condition ?  when_true : when_false
    puts "> #{index + 1} - #{status} #{gift}"
  end
end

while user_action != "quit"
  puts "> Which action [list|add|delete|quit|mark]?"
  user_action = gets.chomp.downcase
  case user_action
  when "list"
    list(christmas_list)
  when "add"
    puts "What would you like to add ?"
    wish_to_add = gets.chomp
    # name_of_the_hash[key_name] = value
    christmas_list[wish_to_add] = false
  when "delete"
    # first solution with letting the user chosing the gift to delete by name
      # puts "What would you like to delete?"
      # list(christmas_list)
      # wish_to_delete = gets.chomp
      # christmas_list.delete(wish_to_delete)
    # Second solution with letting the user chosing the gift to delete by name
      puts "What would you like to delete? Please give a number"
      list(christmas_list)
      index_wish_to_delete = gets.chomp.to_i - 1
      # wish_to_delete = christmas_list.keys[index_wish_to_delete]
      # christmas_list.delete(wish_to_delete)

  when "mark"
    puts "Which item did you buy/want to mark ?"
    # 1.solution with asking the user the name of the product
      # list(christmas_list)
      # gift_to_mark = gets.chomp
      # christmas_list[gift_to_mark] = true
    # 2. solution with asking the user the integer of the product
      list(christmas_list)
      index_gift_to_mark = gets.chomp.to_i - 1
      gift_to_mark = christmas_list.keys[index_gift_to_mark]
      christmas_list[gift_to_mark] = true
      # christmas_list[gift_to_mark] = !christmas_list[gift_to_mark]
  else
    puts "Type an action that exists" unless user_action == "quit"
  end
end

puts "Goodbye!"
