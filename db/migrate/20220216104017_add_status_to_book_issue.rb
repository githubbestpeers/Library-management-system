class AddStatusToBookIssue < ActiveRecord::Migration[5.2]
  def change
    add_column :book_issues, :status, :integer
  end
end
