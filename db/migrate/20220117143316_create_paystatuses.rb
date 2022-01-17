class CreatePaystatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :paystatuses do |t|
      t.string :type

      t.timestamps
    end
  end
end
