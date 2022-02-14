class AddDayToBookIssues < ActiveRecord::Migration[5.2]
  def change
    add_column :book_issues, :day, :datetime
  end
end
