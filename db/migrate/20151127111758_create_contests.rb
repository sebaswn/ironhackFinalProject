class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name
      t.string :description
      t.datetime :uploadBy
      t.datetime :voteBy
      t.datetime :endBy

      t.timestamps null: false
    end
  end
end
