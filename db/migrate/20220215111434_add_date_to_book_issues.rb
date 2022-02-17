class AddDateToBookIssues < ActiveRecord::Migration[5.2]
  def change
    add_column :book_issues, :date, :datetime
  end
end
