class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name
      t.string :description
      t.date :uploadBy
      t.date :voteBy
      t.date :endBy
      t.timestamps null: false
    end
  end
end
