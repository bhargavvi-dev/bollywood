class AddAttachmentPhotoToContentResources < ActiveRecord::Migration
  def self.up
    change_table :content_resources do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :content_resources, :photo
  end
end
