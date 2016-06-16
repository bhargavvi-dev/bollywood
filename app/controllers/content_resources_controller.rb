class ContentResourcesController < ApplicationController

  def index
  	@content_item = ContentItem.find(params[:content_item_id])
  	@content_resources  = @content_item.content_resources
  end
end
