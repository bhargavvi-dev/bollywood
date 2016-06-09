class Admin::ContentResourcesController < ApplicationController

	
	def index
  	@content_resources = ContentResource.all
  end

	def new
  	@content_resource = ContentResource.new
  end

  def create
  	content_item = ContentItem.find_by(id:params[:content_item_id])
  	@content_resource = ContentResource.new(content_resource_params)
  	if @content_resource.save
  		content_resource = ContentResource.last 
  		content_item_resource = ContentItemResource.create(:content_item_id => content_item.id, :content_resource_id => content_resource.id )
  		redirect_to admin_data_item_content_item_content_resources_path
  	else
  		render action :"new"
  	end
  end



  private
    def content_resource_params
    	params[:content_resource].permit(:photo,:content_item_id)
    end
end



