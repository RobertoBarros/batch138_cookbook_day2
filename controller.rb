require_relative 'view'
require_relative 'recipe'
require_relative 'scraper'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    list_recipes
  end

  def create
    # 1. ask name
    name = @view.ask_name
    # 2. ask description
    description = @view.ask_description
    cooking_time = @view.ask_cooking_time
    difficult = @view.ask_difficult

    # 3. instaciate new recipe
    recipe = Recipe.new(name: name, description: description, cooking_time: cooking_time, difficult: difficult, done: false)
    # 4. add recipe in cookbook
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # 1. show all recipes index
    list_recipes
    # 2. ask index to destroy
    index = @view.ask_index
    # 3. remove recipe index from cookbook
    @cookbook.remove_recipe(index)
  end

  def mark_as_done
    # 1. show all recipes
    list_recipes
    # 2. ask index
    index = @view.ask_index

    # 3. find recipe by index
    recipe = @cookbook.find(index)

    # 4. mark recipe as done
    recipe.mark_as_done!

    # 5. save csv
    @cookbook.save_csv

  end

  def import
    # 1. ask ingredient
    ingredient = @view.ask_ingredient

    # 2. scrape recipes name from site
    recipes = Scraper.list_recipes(ingredient)

    # 3. list all recipes name with index
    @view.list_recipes_name(recipes)


    # 4. ask index recipe to import
    index = @view.ask_index

    # 5. Intanciate a recipe with imported data

    imported_recipe = recipes[index]

    recipe = Recipe.new(name: imported_recipe[:name], description: imported_recipe[:description], cooking_time: imported_recipe[:cooking_time], difficult: imported_recipe[:difficult], done: false)

    # 6. Add recipe cookbook
    @cookbook.add_recipe(recipe)


  end


  private

  def list_recipes
    # 1. get all cookbook recipes
    recipes = @cookbook.all
    # 2. view list all recipes
    @view.display(recipes)
  end
end