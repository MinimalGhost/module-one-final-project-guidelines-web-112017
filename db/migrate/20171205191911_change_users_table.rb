class ChangeUsersTable < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.rename :name, :first_name
    end
    add_column :users, :last_name, :string
  end
end
