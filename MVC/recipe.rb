class Recipe
  attr_reader :ingredients, :name #read the state of the instance variables at any moment in my program of these instances.

  # attr_writer :name

  attr_accessor :name #(attr_writer :name +   attr_reader :name)

  def initialize(name)
    @name = name
    @ingredients = []
  end

  def add_ingredient(ingredient)
    @ingredients << ingredient
  end
end

my_recipe = Recipe.new('apple pie recipe')
my_recipe.ingredients

#read the value of @name
my_recipe.name

# write the value of @name
my_recipe.name = 'fabrizios pasta'
puts my_recipe.name
