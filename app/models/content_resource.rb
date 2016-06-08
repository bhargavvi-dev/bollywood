class ContentResource < ActiveRecord::Base
	has_many :content_item_resources
    has_many :content_items, :through => :content_item_resources
end
