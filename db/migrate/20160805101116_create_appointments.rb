class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :what
      t.string :where
      t.string :when
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
