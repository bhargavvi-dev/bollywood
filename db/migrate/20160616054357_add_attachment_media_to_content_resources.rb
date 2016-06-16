class AddAttachmentMediaToContentResources < ActiveRecord::Migration
  def self.up
    change_table :content_resources do |t|
      t.attachment :media
    end
  end

  def self.down
    remove_attachment :content_resources, :media
  end
end
