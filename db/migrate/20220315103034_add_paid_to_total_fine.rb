class AddPaidToTotalFine < ActiveRecord::Migration[5.2]
  def change
    add_column :total_fines, :paid, :boolean
    add_column :total_fines, :token, :string
    add_column :total_fines, :price, :integer
  end
end
