class Artist < ActiveRecord::Base

	has_many :artist_users,:dependent => :destroy
	has_many :users, :through => :artist_users
	has_many :data_items

	validates :real_name,:address,:dob,:hometown, presence: true
	delegate :news, :events, :photo_galleries, to: :data_items
end
