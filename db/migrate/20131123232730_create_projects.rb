class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :text
      t.string :genre
      t.string :rating
      t.string :language

      t.timestamps
    end
  end
end
