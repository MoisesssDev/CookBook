class CreateCategoryRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :category_recipes do |t|
      t.references :recipes, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
