require 'csv'
require_relative 'recipe'
class Cookbook #this is ruby memory
  def initialize(csv_file)
    @recipes = []
    # logic of parsing/loading csv
    # load csv: going from text format to ruby instances.
    @csv_file = csv_file
    load_csv
  end

  # DB in the ruby memory
  # add recipes
  def add_recipe(recipe)
    @recipes << recipe
    # need to call save_to_csv
    save_to_csv
  end

  # delete recipes
  def remove_recipe(index)
    @recipes.delete_at(index)
    # need to call save_to_csv
    save_to_csv
  end

  # read what is inside of my storage
  def all
    @recipes
  end

  def update_status(recipe_index)
   r = @recipes[recipe_index]
   r.mark_as_done
   save_to_csv
  end

  private

  def load_csv
   CSV.foreach(@csv_file) do |row|
    # row[2] => "true" or it can also be "false"
    # "true" == "true" => true # startegy allows us to transform a string into a boolean
    # "true" == "false" => false # startegy allows us to transform a string into a boolean
    @recipes << Recipe.new({name: row[0], description: row[1], done: row[2] == "true"})
   end
  end

  def save_to_csv
    #going from ruby instance to text format in the csv
    # wb stands for write binary
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.done?]
      end
    end
  end
end
