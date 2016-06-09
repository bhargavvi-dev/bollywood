class ContentResourcesController < ApplicationController
  def new
  	@content_resource = ContentResource.new
  end

  def create
  	@content_resource = ContentResource.new(content_resource_params)
  	if @content_resource.save
  		redirect_to content_resources_path
  	else
  		render action :"new"
  	end
  end

  def index
  	@content_resources = ContentResource.all
  end

  private
    def content_resource_params
    	params[:content_resource].permit(:photo)
    end
end
