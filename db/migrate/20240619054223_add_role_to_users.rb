class AddRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :string
    change_column_default :users, :role, 'owner'
  end
end
