class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.decimal :preparation_time, precision: 10, scale: 2, null: false
      t.decimal :cooking_time, precision: 10, scale: 2, null: false
      t.string :description
      t.boolean :public, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
