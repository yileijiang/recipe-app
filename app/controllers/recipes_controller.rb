class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  
  def index
    @recipes = policy_scope(Recipe).order(created_at: :desc)
  end

  def show
  end

  def new
    @recipe = Recipe.new
    authorize @recipe
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    authorize @recipe
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  def filter
    @recipes = Recipe.joins(:categorizations).joins(:tags).where(tags: { name: "desert" })
  end
  
  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, ingredients_attributes: [:name, :quantity], tag_ids: [])
  end

end
