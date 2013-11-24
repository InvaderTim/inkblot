class AddCoverartToProject < ActiveRecord::Migration
  def change
    add_column :projects, :image, :string
  end
end
