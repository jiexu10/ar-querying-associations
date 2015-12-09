class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title, null: false, not_blank: true, unique: true
      t.string :servings
      t.text :ingredients, null: false
      t.text :steps, null: false

      t.timestamps null: false
    end
  end
end
