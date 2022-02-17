class AddTotalDayToBookIssues < ActiveRecord::Migration[5.2]
  def change
    add_column :book_issues, :total_day, :integer
  end
end
