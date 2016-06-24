class ContentMetadataPhotoGallery < ActiveRecord::Base
  belongs_to :data_item
  has_many :content_metadata_photo_gallary_i18ns
end
