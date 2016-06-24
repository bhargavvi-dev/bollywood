class ContentMetadataEvent < ActiveRecord::Base
  belongs_to :data_item
  has_many :content_metadata_event_i18ns
end
