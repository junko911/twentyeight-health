class RemoveColumnState < ActiveRecord::Migration[6.1]
  def change
    remove_column :patients, :state
  end
end
