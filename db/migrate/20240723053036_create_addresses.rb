class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :address
      t.string :city
      t.string :state
      t.string :ddd
      t.integer :quantity_searched

      t.timestamps
    end
  end
end
