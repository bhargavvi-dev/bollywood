class Admin::ContentItemsController < ApplicationController
 before_filter :authenticate_user!
  before_action :set_data_item
  before_action :set_content_item,only: [:show, :edit, :update, :destroy]

 	def index
    @content_items = @data_item.content_items
	end

	def new
    @content_item = @data_item.content_items.new
  end

  def create
    @content_item = @data_item.content_items.new(content_item_params)
    if @content_item.save
      redirect_to admin_data_item_content_items_path(@data_item),:notice => "Content Item Added to #{@data_item.title}"
    else
      render 'new'  
    end
  end

  def update
  	if @content_item.update(content_item_params)
    	redirect_to admin_data_item_content_items_path, :notice => "Content Item update"
  	else
    	render 'edit'
  	end
  end

  def destroy
  	@content_item.destroy
 		redirect_to admin_data_item_content_items_path, :alert => "Content Item Deleted"
  end

  def edit
  end

  def show
  end
  
  private
  def set_data_item
  	@data_item = current_artist.data_items.find(params[:data_item_id])
  end
  
  def set_content_item
    @content_item = @data_item.content_items.find(params[:id])
  end

  def content_item_params
    params.require(:content_item).permit(:title, :description, :data_item_id)
  end

end

