class AddSubmitDateToSubmitBook < ActiveRecord::Migration[5.2]
  def change
    add_column :submit_books, :submit_date, :datetime
  end
end
