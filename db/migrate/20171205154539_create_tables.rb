class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.integer :year
    end

    create_table :reviews do |t|
      t.integer :rating
      t.string :description
      t.integer :user_id
      t.integer :book_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
    end

    create_table :users do |t|
      t.string :name
    end
  end
end
