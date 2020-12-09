class AddForeignKeyUserToRecipe < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :user_id
    add_reference :recipes, :user, foreign_key: true
  end
end
