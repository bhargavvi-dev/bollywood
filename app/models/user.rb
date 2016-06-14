class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  	has_many :artist_users,:dependent => :destroy
    has_many :artists, :through => :artist_users
   
	# after_save :set_artist_user
	
	# def set_artist_user
	#   artist = self.artist_users.admin.artist 
	#   self.artist_users.create(:artist => artist)
	# end

	def set_artist_user
		
	end
end
