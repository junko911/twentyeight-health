class ChangeDateOfBirthToDate < ActiveRecord::Migration[6.1]
  def change
    change_column :patients, :date_of_birth, :date
  end
end
