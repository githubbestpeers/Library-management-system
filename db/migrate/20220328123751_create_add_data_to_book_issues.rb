class CreateAddDataToBookIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :add_data_to_book_issues do |t|
      t.string :token
      t.string :charge_id
      t.string :error_message
      t.string :customer_id
      t.integer :payment_gateway

      t.timestamps
    end
  end
end
