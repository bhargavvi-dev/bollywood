class ContentItem < ActiveRecord::Base
  belongs_to :data_item

  has_many :content_item_resource
	has_many :content_resource, :through => :content_item_resource

	validates_presence_of :title, :description
end
