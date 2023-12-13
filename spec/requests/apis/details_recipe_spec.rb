require "rails_helper"

describe "Details recipe API" do
  context "GET api/v1/recipes/1" do
    it "success" do
      # Arrange
      user = create(:user, email: 'user@email.com', password: '123456', role: :user)
      create(:recipe_type, name: 'Lanche')
      recipe = create(:recipe, user: user)
      
      #Act
      get "/api/v1/recipes/#{recipe.id}"

      #Assert
      expect(response).to have_http_status(:ok)  
      expect(response.content_type).to include("application/json")
      
      json_response = JSON.parse(response.body)
      expect(json_response["title"]).to include(recipe.title)
      expect(json_response["ingredients"]).to include(recipe.ingredients)
      expect(json_response["cook_time"]).to be_a_kind_of(Integer)
      expect(json_response["instructions"]).to include(recipe.instructions)
      expect(json_response["recipe_type_id"]).not_to be_a_kind_of(Integer)

      expect(json_response["user"]["email"]).to include(user.email)

    end

    it "no recipes" do
      # Act
      get "/api/v1/recipes/99"

      # Assert 
      json_response = JSON.parse(response.body)
      expect(json_response["message"]).to include("Receita não encontrada")
    end
    
    
  end
  
end
