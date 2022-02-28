class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :query
      t.integer :phone

      t.timestamps
    end
  end
end
