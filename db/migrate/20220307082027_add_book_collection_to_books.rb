class AddBookCollectionToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :bookcollection, :integer
  end
end
