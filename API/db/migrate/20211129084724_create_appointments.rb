class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.integer :pet_id
      t.integer :vet_id
      t.datetime :date

      t.timestamps
    end
  end
end
