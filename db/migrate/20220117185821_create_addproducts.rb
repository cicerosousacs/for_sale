class CreateAddproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :addproducts do |t|
      t.string :product
      t.string :price
      t.references :sales, foreign_key: true

      t.timestamps
    end
  end
end
