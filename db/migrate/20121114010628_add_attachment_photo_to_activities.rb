class AddAttachmentPhotoToActivities < ActiveRecord::Migration
  def self.up
    change_table :activities do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :activities, :photo
  end
end
