class CategoryRecipe < ApplicationRecord
  has_many :recipes_id
  belongs_to :user
end
