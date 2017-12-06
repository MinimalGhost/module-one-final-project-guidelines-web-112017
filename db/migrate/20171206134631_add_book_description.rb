class AddBookDescription < ActiveRecord::Migration[5.0]
  def change
     add_column :books, :description, :string
  end
end
