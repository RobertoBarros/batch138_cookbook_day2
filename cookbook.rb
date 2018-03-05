require 'csv'

class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []
    load_csv
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  def find(index)
    @recipes[index]
  end

  def all
    @recipes
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.cooking_time, recipe.difficult, recipe.done]
      end
    end
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      done = row[4] == 'true' ? true : false
      @recipes << Recipe.new(name: row[0], description: row[1], cooking_time: row[2],difficult: row[3], done: done)
    end
  end

end