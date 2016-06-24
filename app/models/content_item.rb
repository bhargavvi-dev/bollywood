class ContentItem < ActiveRecord::Base
  belongs_to :data_item

  has_many :content_item_resources
  has_many :content_resources, :through => :content_item_resources
  

	validates_presence_of :title, :description
end
