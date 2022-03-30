class AddDataToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :stripe_p_name, :string
    add_column :books, :paypal_p_name, :string
  end
end
