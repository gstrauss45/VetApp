class AddVetToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :vet_id, :integer
  end
end
