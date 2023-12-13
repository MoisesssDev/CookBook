class AddNameFromCategoryRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :category_recipes, :name, :string
  end
end
