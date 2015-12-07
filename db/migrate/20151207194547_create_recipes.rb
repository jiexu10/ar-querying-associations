class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :ingredients, null: false
      t.text :steps, null: false

      t.timestamps null: false
    end
  end
end