class Admin::ContentResourcesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_data_item
	before_action :set_content_item
	before_action :set_content_resources,only: [:destroy]
	
	def index
		@content_resources = @content_item.content_resources
  end

	def new
  	@content_resource = @content_item.content_resources.new
  end

  def create
  	@content_resource =  @content_item.content_resources.new(content_resource_params)
  	if @content_resource.save
  		 redirect_to admin_data_item_content_item_content_resources_path, :notice => "Content Resource Added to #{@content_item.title}"
  	else
       flash[:alert] ="Content Resource not saved"
  		 render 'new'
  	end
  end

  def destroy
  	@content_resource.destroy
 		redirect_to admin_data_item_content_item_content_resources_path, :alert => "Content Resource Deleted"									
	end

  private
  
    def set_data_item
      @data_item = current_artist.data_items.find(params[:data_item_id])
    end

  	def set_content_item
  		@content_item = @data_item.content_items.find(params[:content_item_id])
  	end

    def set_content_resources
      @content_resource = @content_item.content_resources.find(params[:id])
    end
    
    def content_resource_params
    	params[:content_resource].permit(:media,:content_item_id)
    end
end



