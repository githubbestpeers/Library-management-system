class AddTotalToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :Total, :integer ,default: 100
  end
end