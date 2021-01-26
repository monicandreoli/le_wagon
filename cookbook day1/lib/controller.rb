require_relative 'view'
require_relative 'cookbook'
class Controller

  # state/data
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  # behavior => user actions, thats why we call the instance methods, the actions in the controller

  def list #PSEUDO CODING
    # step 1: fetching the recipe instances from the repository. (Cookbook)
    all_my_recipes = @cookbook.all
    # step 2: passing the recipe instances/displaying the recipes instances to the view (View)
    @view.display(all_my_recipes)
  end


  def create
    #We're creating a recipe instance.
    # step 1: we need a name and a description. We need to ask the user.(View)
    recipe_name =  @view.ask_user_for_a_recipe_name
    recipe_desc = @view.ask_user_for_a_recipe_description
    # step 2: Build an instance of a recipe with this information.(model)
    recipe = Recipe.new(recipe_name, recipe_desc)
    # step 3: save your recipe instance in the cookbook(cookbook)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    #step 1. display the recipes to the user()
    list
    #step 2. ask the user which recipe index he wants to destroy(View)
    recipe_index_to_delete = @view.ask_user_for_index_to_delete
    #step 3. Make sur the recipe that the user chose is getting destoryed in the cookbook(Cookbook)
    @cookbook.remove_recipe(recipe_index_to_delete)
  end

end
