class AddRelationshipBetweenPostAndContest < ActiveRecord::Migration
  def change
  	create_table :contests_posts, id: false do |t|
      t.integer :contest_id
      t.integer :post_id
  	end
  end
end
