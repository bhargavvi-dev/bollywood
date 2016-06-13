class  Users::SessionsController < Devise::SessionsController
	
 def new
 	super
 end

 def create
 	 user = User.find_by_email(params[:user][:email])
 	 if user.blank?
 	 	 redirect_to(user_session_path, :notice => 'Record Not Found or Please Enter Email and Password') 
 	 	else
 	 	if user.artist_users.first.is_admin?
 	    super
 	    flash[:notice] = "Artist Signed in Successfully.."
		else
 	 		flash[:error] = "Access denied - You are not authorized Artist"
 	 		redirect_to user_session_path
 		end
 	end
 end

 def destroy
    super
  end 
end
