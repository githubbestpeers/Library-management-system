class AddDataToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :stripe_id, :string
    add_column :users, :stripe_subscription_id, :string
    add_column :users, :card_last, :string
    add_column :users, :card_exp_month, :integer
    add_column :users, :card_type, :integer
    add_column :users, :card_exp_year, :integer
    add_column :users, :subscription, :boolean
  end
end
