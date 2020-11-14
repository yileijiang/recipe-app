class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save

    redirect_to restaurant recipe_path(@recipe)
  end
  
  private

  def recipe_params
    params.require(:recipes).permit(:name, :description)
  end

end
