class View #gets.chomp and display.

  # behavior/instance methods
  def display(array_recipes)
    array_recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name} #{recipe.description}"
    end
  end

  def ask_user_for_a_recipe_name
    puts "what is the name of the recipe"
    gets.chomp
  end

  def ask_user_for_a_recipe_description
    puts "what is the description of the recipe"
    gets.chomp
  end

  def ask_user_for_index_to_delete
    puts "what is the index of the recipe you want to delete"
    gets.chomp.to_i - 1
  end
end
