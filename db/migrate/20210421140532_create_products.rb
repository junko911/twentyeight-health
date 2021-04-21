class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :ndc
      t.integer :quantity
      t.integer :price
      t.string :instruction

      t.timestamps
    end
  end
end
