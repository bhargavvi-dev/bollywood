class ContentResource < ActiveRecord::Base

    has_many :content_item_resource,:dependent => :destroy
    validates :photo, :presence => true
	has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
