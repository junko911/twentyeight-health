class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :fullname
      t.string :email
      t.string :date_of_birth
      t.string :state

      t.timestamps
    end
  end
end
