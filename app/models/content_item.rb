class ContentItem < ActiveRecord::Base
	belongs_to :data_item

	has_one :content_item_resource
	has_one :content_resource, :through => :content_item_resource
end
