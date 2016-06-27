class ContentMetadataNews < ActiveRecord::Base
  belongs_to :data_item
  has_many :content_metadata_newsi18ns,:dependent => :destroy
end
