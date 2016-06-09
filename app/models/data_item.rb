class DataItem < ActiveRecord::Base

	belongs_to :artist
  has_many :content_items
  
  self.inheritance_column = nil
end
