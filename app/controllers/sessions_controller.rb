class  SessionsController < Devise::SessionsController
	
 def new
 	super
 end

 def create
 	 user = User.find_by_email(params[:user][:email])
 	 if user.artist_users.first.is_admin?
 	    super
 	    flash[:notice] = "Artist Signed in Successfully.."
	else
 	 	flash[:error] = "do not have access."
 	 	redirect_to root_path
 	end
 end

 def destroy
    super
  end  
end
