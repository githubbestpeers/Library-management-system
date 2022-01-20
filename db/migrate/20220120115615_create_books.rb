class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.bigint :price
      t.string :author
      t.string :book_no

      t.timestamps
    end
  end
end
