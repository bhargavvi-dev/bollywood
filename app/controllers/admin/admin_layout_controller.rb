class Admin::AdminLayoutController <  ApplicationController
	before_filter :authenticate_user!

end
