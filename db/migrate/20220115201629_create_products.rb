class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.references :category, foreign_key: true
      t.string :stock
      t.decimal :price

      t.timestamps
    end
  end
end
