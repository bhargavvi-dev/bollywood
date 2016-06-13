class Admin::ContentItemsController < ApplicationController

  before_action :set_data_item

 	def index
    @content_items = @data_item.content_items
	end

	def new
    @content_item = ContentItem.new
  end

  def edit
  	@content_item = @data_item.content_items.find(params[:id])
  end

  def show
  	@content_item = @data_item.content_items.find(params[:id])
  end

  def create
    @content_item =@data_item.content_items.new(content_item_params)
    if @content_item.save
    	 flash[:success] = "Content Item Added to #{@data_item.title}"
      redirect_to admin_data_item_content_items_path(@data_item)
    else
      render 'new'  
    end
  end

  def update
  	@content_item = @data_item.content_items.find(params[:id])

  	if @content_item.update(content_item_params)
  		flash[:notice] = "Content Item update"
    	redirect_to admin_data_item_content_items_path
  	else
    	render 'edit'
  	end
  end

  def destroy
  	@content_item = @data_item.content_items.find(params[:id])
  	@content_item.destroy
 		flash[:alert] = "Content Item Deleted"
  	redirect_to admin_data_item_content_items_path										
	end

  private
  
  def set_data_item
  	@data_item = current_artist.data_items.find(params[:data_item_id])
  end
  def content_item_params
    params.require(:content_item).permit(:title, :description, :data_item_id)
  end

end

