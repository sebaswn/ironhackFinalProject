class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :description
      t.string :location
      t.float :coordinateY
      t.float :coordinateX
    
      t.timestamps null: false
    end
  end
end
