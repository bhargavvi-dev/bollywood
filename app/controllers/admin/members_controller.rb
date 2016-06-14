class Admin::MembersController < ApplicationController
  
  before_filter :authenticate_user!
  before_action :set_artist_user, only: [:show, :edit, :update, :destroy]
    
 def index
    @members = current_artist.artist_users.where(:is_admin => false)
 end
 
 def new
  	@member = User.new
 end
 
 def edit
    @member=@artist_user.user
 end

 def create
  @member = User.new(member_params)
    if @member.save
      flash[:success] = "Member Added Successfully."
      artist_user= ArtistUser.create(:artist_id => current_artist.id, :user_id => @member.id)
    	redirect_to admin_members_path
  	else
    	render 'new'
  	end
 end  
 
 def update
  @member=@artist_user.user
    if @member.update(member_params)
      flash[:notice] = "Member updated"
      redirect_to admin_members_path
    else
      render 'edit'
    end
 end
  
 def destroy
  @member=@artist_user.user
  @member.destroy
  flash[:alert] = "Destroy Member successfully."
  redirect_to admin_members_path
 end

  private

  def set_artist_user
    @artist_user = ArtistUser.find(params[:id])
  end

  def member_params
    params.require(:user).permit(:email, :password,:password_confirmation)
  end
end