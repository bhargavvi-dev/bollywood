class Admin::AdminLayoutController <  ApplicationController
	before_filter :authenticate_user!
	
  def index
  	 # user = User.find(current_user.id)
  	 # @au = user.artist_users.where(:is_admin => false)
  end
end
