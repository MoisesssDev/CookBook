class RemoveRecipesFromCategoryRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :category_recipes, :recipes
  end
end
