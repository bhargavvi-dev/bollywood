class ContentMetadataEvent < ActiveRecord::Base
  belongs_to :data_item
  has_many :content_metadata_eventi18ns, :dependent => :destroy
end
