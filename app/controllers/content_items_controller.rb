class ContentItemsController < ApplicationController
	def index
		@data_item = DataItem.find(params[:data_item_id])
		@artist = Artist.find(params[:artist_id])
		@content_items = @data_item.content_items
	end
end
