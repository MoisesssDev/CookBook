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

    end
    
  end
  
end
