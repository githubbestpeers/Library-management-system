class AddTotalFineToBookIssues < ActiveRecord::Migration[5.2]
  def change
    add_column :book_issues, :total_fine, :integer
  end
end
