class ChangeColumn < ActiveRecord::Migration
  def change
  	rename_column :content_metadata_events, :content_item_id, :data_item_id
  	rename_column :content_metadata_photo_galleries, :content_item_id, :data_item_id
  end
end
