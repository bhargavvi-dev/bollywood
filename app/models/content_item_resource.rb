class ContentItemResource < ActiveRecord::Base
  belongs_to :content_item
  belongs_to :content_resource
end
