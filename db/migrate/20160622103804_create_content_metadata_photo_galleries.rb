class CreateContentMetadataPhotoGalleries < ActiveRecord::Migration
  def change
    create_table :content_metadata_photo_galleries do |t|
      t.references :content_item, index: true, foreign_key: true
      t.string :author
      t.string :dimensions

      t.timestamps null: false
    end
  end
end
