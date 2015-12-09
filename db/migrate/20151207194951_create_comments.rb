class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false, length_within: 1..140
      t.belongs_to :recipe, index: true

      t.timestamps null: false
    end
  end
end
