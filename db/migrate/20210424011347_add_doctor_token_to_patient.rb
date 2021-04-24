class AddDoctorTokenToPatient < ActiveRecord::Migration[6.1]
  def change 
    add_column :patients, :doctor, :string
    add_column :patients, :token, :string
  end
end
