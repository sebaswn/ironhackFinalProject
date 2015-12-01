class AddAttachmentCoverToContests < ActiveRecord::Migration
  def self.up
    change_table :contests do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :contests, :cover
  end
end
