class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.datetime :date
      t.references :client, foreign_key: true
      t.references :payment, foreign_key: true
      t.string :invoice
      t.references :paystatus, foreign_key: true

      t.timestamps
    end
  end
end
