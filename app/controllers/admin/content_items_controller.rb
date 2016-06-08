class Admin::ContentItemsController < ApplicationController

 	def index
    artist_id = current_user.artists.first
    @content_items = ContentItem.all.where(:artist_id => artist_id)
	end

	def new
    @content_item = ContentItem.new
  end

  def edit
  	@content_item = ContentItem.find(params[:id])
  end

  def show
  	
  	@content_item = ContentItem.find(params[:id])
  
  end

  def create
    artist = current_user.artists.last

    @content_item = artist.content_items.new(content_item_params)
  
    if @content_item.save
      redirect_to admin_content_item_path(@content_item)
    else
      render 'new'  
    end
  end

  def update
  	@content_item = ContentItem.find(params[:id])
 
  	if @content_item.update(content_item_params)
    	redirect_to @content_item
  	else
    	render 'edit'
  	end
  end
  def destroy
  	@content_item = ContentItem.find(params[:id])
  	@content_item.destroy
 
  	redirect_to admin_content_item_path
	end

  private
   def content_item_params
     params.require(:content_item).permit(:title, :description, :data_item_id)
   end

end

