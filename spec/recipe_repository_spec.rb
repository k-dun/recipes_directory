require 'recipe_repository'

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  context '#all' do
    it 'returns the amount of rows in the table' do
      repo = RecipeRepository.new
      recipes = repo.all
      expect(recipes.length).to eq 3
    end

    it 'returns the correct data within a row' do
      repo = RecipeRepository.new
      recipes = repo.all

      expect(recipes[0].id).to eq "1"
      expect(recipes[0].name).to eq "Zupa"
      expect(recipes[0].time_required).to eq "60"
      expect(recipes[0].rating).to eq "4"
    end

    it 'returns the correct data within a row' do
      repo = RecipeRepository.new
      recipes = repo.all

      expect(recipes[1].id).to eq "2"
      expect(recipes[1].name).to eq "Bigos"
      expect(recipes[1].time_required).to eq "120"
      expect(recipes[1].rating).to eq "3"
    end
  end

  context '#find' do
    it 'returns the correct recipe' do
      repo = RecipeRepository.new
      recipe = repo.find("3")

      expect(recipe.id).to eq "3"
      expect(recipe.name).to eq "Pierogi"
      expect(recipe.time_required).to eq "45"
      expect(recipe.rating).to eq "5"
    end

    it 'returns the correct recipe' do
      repo = RecipeRepository.new
      recipe = repo.find("1")

      expect(recipe.id).to eq "1"
      expect(recipe.name).to eq "Zupa"
      expect(recipe.time_required).to eq "60"
      expect(recipe.rating).to eq "4"
    end
  end
end