class AddBookNoToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :book, :string
    add_column :users, :no, :integer
  end
end
