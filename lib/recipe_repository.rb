require 'recipe'

class RecipeRepository
  @recipes = []
  
  def initialize
  end

  def all
    @recipes = []

    sql = "SELECT * FROM recipes;"
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |row|
      recipe = Recipe.new
      recipe.id = row["id"]
      recipe.name = row["name"]
      recipe.time_required = row["time_required"]
      recipe.rating = row["rating"]

      @recipes << recipe
    end

    return @recipes
  end

  def find(id)
    recipes = all
    recipes.each { |item| return item if id == item.id }
  end
end