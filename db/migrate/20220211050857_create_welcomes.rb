class CreateWelcomes < ActiveRecord::Migration[5.2]
  def change
    create_table :welcomes do |t|
      t.string :name
      t.string :email
      t.string :query

      t.timestamps
    end
  end
end
