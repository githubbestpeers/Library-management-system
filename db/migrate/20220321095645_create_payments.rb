class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :password_hash
      t.integer :pay

      t.timestamps
    end
  end
end
