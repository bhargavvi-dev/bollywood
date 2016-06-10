class Admin::ContentItemsController < ApplicationController

 	def index
    #@content_items = ContentItem.all #where(:artist_id => artist_id)
    #@data_item = DataItem.find_by(params[:data_item_id])
    @data_item = DataItem.find_by(id:params[:data_item_id])
    @content_items = @data_item.content_items
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
  	@data_item = DataItem.find_by(id:params[:data_item_id])
    @content_item =@data_item.content_items.new(content_item_params)
    if @content_item.save
    	 flash[:success] = "Content Item Added to #{@data_item.title}"
      redirect_to admin_data_item_content_items_path(@data_item)
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
 
  	redirect_to admin_data_item_content_items_path										
	end

  private
   def content_item_params
     params.require(:content_item).permit(:title, :description, :data_item_id)
   end

end

