require 'byebug'

class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @dose.ingredient = Ingredient.find_by(name: params[:dose][:ingredient])
    @dose.cocktail = @cocktail
    @dose.description = params[:dose][:description]
    @doses = Dose.all
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end
end
