class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :gender
      t.date :birth_date
      t.string :cpf
      t.string :address

      t.timestamps
    end
  end
end
