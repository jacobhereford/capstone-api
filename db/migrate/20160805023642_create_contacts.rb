class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :works_at
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
