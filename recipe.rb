class Recipe
  attr_reader :name, :description, :cooking_time, :difficult, :done

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @cooking_time = attributes[:cooking_time]
    @difficult = attributes[:difficult]
    @done = attributes[:done]
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end

end