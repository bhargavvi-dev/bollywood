class Admin::MembersController < ApplicationController
  before_filter :authenticate_user!
    def index
    
    artist_id = current_user.artists.first
    @members = ArtistUser.all.where(:artist_id => artist_id, :is_admin => false)
  end
 def new
  	@member = User.new
 end
 def edit
  	@artist_user = ArtistUser.find_by(id:params[:id])
    @member=@artist_user.user
  end

 def create
    
    @member = User.new(member_params)
    if @member.save
      flash[:notice] = "member added successfully."
    	redirect_to admin_members_path
      artist = current_user.artists.ids.last
      member = User.last
      artist_user= ArtistUser.create(:artist_id => artist, :user_id => member.id)
  	else
    	render 'new'
  	end
 end  
 def show
 end	
 def update
    @member = User.find(params[:id])
 
    if @member.update(member_params)
      redirect_to @member
    else
      render 'edit'
    end
  end
  def destroy
    @member = User.find(params[:id])
    @member.destroy
    flash[:notice] = "destroy member successfully."
    redirect_to admin_members_path
  end

  private
  def member_params
    params.require(:user).permit(:email, :password,:password_confirmation)
  end
end