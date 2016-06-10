class DataItem < ActiveRecord::Base
  belongs_to :artist
  has_many :content_items

  self.inheritance_column = :type

   scope :news, -> { where(type: 'News') }
   scope :event, -> { where(type: 'Event') }
   scope :photo_gallery, -> { where(type: 'Photo_gallery') }

   validates_presence_of :title


  class << self
    def types
      %w(News Event Photo_gallery)
    end
  end

end
