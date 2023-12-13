class Api::V1::RecipesController < ApplicationController
  def show
    begin
      recipe = Recipe.find(params[:id])

      render status: :ok, json: recipe.as_json(except: [:created_at, :updated_at, :recipe_type_id, :user_id], include: :user)
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, json: { message: "Receita não encontrada" }
    end
    
  end
end
