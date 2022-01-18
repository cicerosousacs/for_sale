class CreateAdproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :adproducts do |t|
      t.string :product
      t.string :price
      t.references :sale, foreign_key: true

      t.timestamps
    end
  end
end
