class Admin::ContentResourcesController < ApplicationController

	before_action :set_content_item
	before_action :set_data_item
	after_action  :add_content_item_resources,only: [:create]
	before_action :set_content_item_resources,only: [:destroy]
	
	def index
		@content_resources  = @content_item.content_item_resource
  end

	def new
  	@content_resource = ContentResource.new
  end

  def create
  	@content_resource = ContentResource.new(content_resource_params)
  	if @content_resource.save
  		flash[:success] = "Content Resource Added to #{@content_item.title}"
  		redirect_to admin_data_item_content_item_content_resources_path
  	else
  		render 'new'
  	end
  end

  def destroy
  	@content_resource = @content_item_resource.content_resource
    @content_resource.destroy
 		flash[:alert] = "Content Resource Deleted"
  	redirect_to admin_data_item_content_item_content_resources_path										
	end

  private
  
  	def set_content_item
  		@content_item = ContentItem.find(params[:content_item_id])
  	end
  	
  	def set_data_item
  		@data_item = DataItem.find(params[:data_item_id])
  	end

  	def add_content_item_resources
	  	content_item_resource = ContentItemResource.create(:content_item_id => @content_item.id, :content_resource_id => @content_resource.id )
  	end	

  	def set_content_item_resources
  		@content_item_resource = ContentItemResource.find(params[:id])	
  	end
    
    def content_resource_params
    	params[:content_resource].permit(:photo,:content_item_id)
    end
end



