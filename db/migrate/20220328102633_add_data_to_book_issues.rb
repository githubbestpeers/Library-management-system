class AddDataToBookIssues < ActiveRecord::Migration[5.2]
  def change
    add_column :book_issues, :token, :string
    add_column :book_issues, :charge_id, :string
    add_column :book_issues, :error_message, :string
    add_column :book_issues, :customer_id, :string
    add_column :book_issues, :payment_gateway, :integer
  end
end
