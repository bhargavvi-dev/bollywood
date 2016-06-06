class ArtistUser < ActiveRecord::Base
  belongs_to :artist
  belongs_to :user

  #scope :admin {where (:is_admin => true).first}
  #scope :admin, -> { where(is_admin: 'f').first}
end
