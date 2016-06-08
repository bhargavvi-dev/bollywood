class ContentItem < ActiveRecord::Base
  belongs_to :data_item

  has_many :content_item_resources
  has_many :content_resources, :through => :content_item_resources
end
