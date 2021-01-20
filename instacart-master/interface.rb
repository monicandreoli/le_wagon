# interface.rb

# Pseudo-code
# 1. Print Welcome
# 2. Define your store (what items are for sale?)
# 3. Get items from the user (shopping)
# 4. Print the bill (checkout)


# INPUT:
# OUR SUPERMARKET IS A HASH.
# store_items = {
#   # product_name => its price
#   'kiwi' => 2,
#   'apple' => 4,
#   'mango' => 6
# }
# PSEUDO-CODING
  # 1.You enter the shop and you have an empty shopping cart (array in ruby). You need to see what is in the supermarket.
    # 1.a Ask the user what he/she wants to buy ?
  #   1.b store the user_item in a variable (it's a string)
  # 2. Add the user_item inside of your shopping cart
  #   2.a push the user_item inside of the shopping cart
  #   2.b if the user_item does not exist in the store_items(supermarket), we should tell the user we don't have it
  # 3. Pay for his/her bill at the counter.
  #   3.1 get out of the loop by typing quit
  #   3.2 Create/calculate the bill.
  #     we need to access the price of each item that the user chose.
  #     shopping_cart = ['kiwi', 'apple']
  #     price of kiwi ? store_items[user_item]

# OUTPUT:
# bill => it's a float.

# store_items = {
#   # product_name => its price
#   'kiwi' => 2,
#   'apple' => 4,
#   'mango' => 6
# }

# shopping_cart = []

# puts "> --------------------"
# puts "> Welcome to Instacart"
# puts "> --------------------"

# store_items.each do |key, value|
#   puts "#{key}: #{value}€"
# end

# user_item = ""
# until user_item == "quit"
#   puts "Which item do you want to buy? quit to checkout"
#   user_item = gets.chomp
#   # if store_items[user_item] #trying to read a hash, try to read the value of a key.
#   if store_items.key?(user_item)
#     shopping_cart << user_item
#     # shopping_cart.push(user_item)
#   else
#     puts "Sorry, we don't have #{user_item} today.." if user_item != "quit"
#   end

#   puts "Your shopping cart#{shopping_cart}"
# end

# # check what is in your shopping cart (array)
# # get the value of each item
# bill = 0 #declaring the bill as an integer because we need it inside of the loop.
# shopping_cart.each do |user_item|
#   puts "#{user_item} #{store_items[user_item]}"
#   # read in a hash: name_of_the_hash[name_of_the_key]
#   bill += store_items[user_item]
#   # incrementing/re-assignement of the bill by adding up the price of each item.
# end


# puts "> -------BILL---------"
# puts "> TOTAL: #{bill}€"
# puts "> --------------------"


# step 2: adding quantity
# 1.after asking the user what item he wants to buy
# 2. Ask the user how much of this item he wants ?
# 3.item_quantity stored as an integer (unlimited in the supermaket but you need to use this quantity to calculate the bill)
  #3.1 Now we need to modelise the shopping cart not anymore as an array but as a hash.
  # shopping_cart = { 'kiwi' => 1, 'apple' => 2}
  # => you'll need to modify the code so that we don t add an element to an array anymore but to a hash
  #3.2 add the key value(user item and the item_quantity) pair in the shopping cart
#4. Calculating the bill taking into account the change of datatype of the shopping cart.

# SUPERMARKET
# store_items = {
#   'kiwi' => 2,
#   ...
# }

# MY SHOPPING
# shopping_cart = {
#   'kiwi' => 1
#   'name_of_product' => quantity
# }



store_items = {
  'kiwi' => 2,
  'apple' => 4,
  'mango' => 6
}

shopping_cart = {}
# where keys are the user_items and values are the user_item_quantity.

puts "> --------------------"
puts "> Welcome to Instacart"
puts "> --------------------"

store_items.each do |key, value|
  puts "#{key}: #{value}€"
end

puts "Hello user, Which first item do you want to buy? "
user_item = gets.chomp

until user_item == "quit"
  puts "How much of this item do you want ?" if user_item != "quit"
  user_item_quantity = gets.chomp.to_i

  if user_item != "quit"
    if store_items.key?(user_item)
      shopping_cart[user_item] = user_item_quantity
    else
      puts "Sorry, we don't have #{user_item} today.."
    end
  end

  puts "Your shopping cart#{shopping_cart}"

  puts "Which item do you want to buy? quit to checkout"
  user_item = gets.chomp
end


bill = 0
shopping_cart.each do |user_item, user_item_quantity|
  item_price = store_items[user_item]
  total_price_per_item = user_item_quantity * item_price
  puts "#{user_item}: #{user_item_quantity} X #{item_price}"
  bill += total_price_per_item
end


puts "> -------BILL---------"
puts "> TOTAL: #{bill}€"
puts "> --------------------"















