class Admin::MembersController < ApplicationController
  
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
    
 def index
    @members = current_artist.users.where("artist_users.is_admin = ?", false)
 end
 
 def new
  	@member = current_artist.users.new
 end

 def create
  @member = current_artist.users.new(member_params)
    if @member.save
      current_artist.artist_users.create(:user_id => @member.id)
    	redirect_to admin_members_path, :success => "Member Added Successfully."
  	else
    	render 'new'
  	end
 end  
 
 def update  
    if @member.update(member_params)
      redirect_to admin_members_path, :notice => "Member updated"
    else
      render 'edit'
    end
 end
  
 def destroy
  @member.destroy  
  redirect_to admin_members_path, :notice => "Destroy Member successfully."
 end

 def edit    
 end

  private

  def set_user
    @member = current_artist.users.find(params[:id])
  end

  def member_params
    params.require(:user).permit(:email, :password,:password_confirmation)
  end
end