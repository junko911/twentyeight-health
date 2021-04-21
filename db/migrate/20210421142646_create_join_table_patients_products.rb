class CreateJoinTablePatientsProducts < ActiveRecord::Migration[6.1]
  def change
    create_join_table :patients, :products
  end
end
