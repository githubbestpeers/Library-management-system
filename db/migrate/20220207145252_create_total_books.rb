class CreateTotalBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :total_books do |t|
      t.references :book_issue, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
