class CreateAddRoleToUsers < ActiveRecord::Migration[5.2]
   add_column :users, :role, :integer, default: 0
end
