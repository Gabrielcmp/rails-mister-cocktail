class RemoveIngredientFromCocktails < ActiveRecord::Migration[5.1]
  def change
    remove_column :cocktails, :ingredient, :string
  end
end
