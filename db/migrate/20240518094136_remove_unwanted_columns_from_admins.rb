class RemoveUnwantedColumnsFromAdmins < ActiveRecord::Migration[6.1]
  def change
    
    remove_column :admins, :last_name
    remove_column :admins, :first_name
    remove_column :admins, :last_name_kana
    remove_column :admins, :first_name_kana
    remove_column :admins, :postal_code
    remove_column :admins, :address
    remove_column :admins, :telephone_number
    remove_column :admins, :is_active
    
  end
end
