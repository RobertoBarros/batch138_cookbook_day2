class View
  def ask_name
    puts "What's the recipe name?"
    gets.chomp
  end

  def ask_description
    puts "What's the recipe description?"
    gets.chomp
  end

  def ask_cooking_time
    puts "What's the cooking time in minutes?"
    gets.chomp
  end

  def ask_difficult
    puts "1. Very Easy | 2. Easy | 3. Moderate | 4. Difficult"
    index = gets.chomp.to_i - 1
    ['Very Easy', 'Easy', 'Moderate', 'Difficult'][index]
  end

  def ask_ingredient
    puts "What's the ingredient to search?"
    gets.chomp
  end

  def ask_index
    puts "What's the recipe index"
    gets.chomp.to_i - 1
  end


  def display(recipes)
    puts "------------- Recipe List---------------"
    recipes.each_with_index do |recipe, index|

      done = recipe.done? ? "[X]" : "[ ]"

      puts "#{index + 1}. #{done} name: #{recipe.name}"
      puts "Cooking Time: #{recipe.cooking_time} min - Dificult: #{recipe.difficult}"
      puts "description: #{recipe.description}"
      puts "\n"
    end
    puts "----------------------------------------"
  end

  def list_recipes_name(recipes)
    #recipes.class => Array:Hash

    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe[:name]}"
    end

  end
end