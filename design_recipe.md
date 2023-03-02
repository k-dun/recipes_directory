recipe_directory Model and Repository Classes Design Recipe

1. DESIGN AND CREATE THE TABLE.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep a list of all my recipes with their names.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep the average cooking time (in minutes) for each recipe.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to give a rating to each of the recipes (from 1 to 5).


Records    |     Properties
- - - - - - - - - - - - - - 
recipes     |     name, time_required, rating


id: SERIAL
name: text
time_required: int
rating: int

-- file: recipes_table.sql

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name text,
  time_required int,
  rating int
);


psql -h 127.0.0.1 recipes_directory < recipes_table.sql
psql -h 127.0.0.1 recipes_directory_test < recipes_table.sql

2. CREATE TEST SQL SEEDS
-- file: spec/seeds_recipes.sql

TRUNCATE TABLE recipes RESTART IDENTITY;

INSERT INTO recipes(name, time_required, rating) VALUES ('Zupa', '60', '4');
INSERT INTO recipes (name, time_required, rating) VALUES ('Bigos', '120', '3');
INSERT INTO recipes (name, time_required, rating) VALUES ('Pierogi', '45', '5');

psql -h 127.0.0.1 recipes_directory_test < seeds_recipes.sql

3. DEFINE THE CLASS NAMES

# table: recipes

# Model class
# (in lib/recipe.rb)

class Recipe
end

# Repository class
# (in lib/recipe_repository.rb)

class RecipeRepository
end

4. IMPLEMENT THE MODEL CLASS

# table: recipes

# Model class
# (in lib/recipe.rb)

class Recipe
  attr_accessor :id, :name, :time_required, :rating
end

5. DEFINE THE REPOSITORY CLASS INTERFACE

# table: recipes

# Repository class
# (in lib/recipe_repository.rb)

class RecipeRepository
  def initialize
  end

  def all
    # executes the SQL query:
    # SELECT id, name, time_required, rating FROM recipes;
    # Returns an array of Recipe objects.
  end

  def find(id)
    # executes the SQL query:
    # SELECT id, name, time_required, rating FROM recipes WHERE id = $1;
    # Returns a specific Recipe object.
  end
end

6. WRITE TEST EXAMPLES

# Get all recipes
repo = RecipeRepository.new
recipes = repo.all

recipes.length # => 3

recipes[0].id # => 1
recipes[0].name # => Zupa
recipes[0].time_required # => 60
recipes[0].rating # => 4

recipes[1].id # => 2
recipes[1].name # => Bigos
recipes[1].time_required # => 120
recipes[1].rating # => 3

# Get a single recipe

repo = RecipeRepository.new
recipe = repo.find("3")

recipe.id # => 3
recipe.name # => Pierogi
recipe.time_required # => 45
recipe.rating # => 5

--

repo = RecipeRepository.new
recipe = repo.find("2")

recipe.id # => 2
recipe.name # => Bigos
recipe.time_required # => 120
recipe.rating # => 3

7. RELOAD THE SQL SEEDS BEFORE EACH TEST RUN

