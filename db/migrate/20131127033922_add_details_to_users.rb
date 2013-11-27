class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :biography, :text
  end
end
