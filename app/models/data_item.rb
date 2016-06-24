class DataItem < ActiveRecord::Base
  belongs_to :artist
  has_many :content_items
  has_many :content_metadata_news, :dependent => :destroy
  has_many :content_metadata_events, :dependent => :destroy
  has_many :content_metadata_photo_galleries, :dependent => :destroy



   self.inheritance_column = :type

   scope :news, -> { where(type: 'News') }
   scope :event, -> { where(type: 'Event') }
   scope :photo_gallery, -> { where(type: 'Photo_gallery') }
   scope :is_active, -> { where('is_active = ?',true) }

   validates_presence_of :title
   
  class << self
    def types
      %w(News Event Photo_gallery)
    end
  end

end
