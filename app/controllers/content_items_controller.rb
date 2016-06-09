class ContentItemsController < ApplicationController
	# def index	
	# 	@artist = Artist.find_by(params[:artist_id])
	# 	@data_item = DataItem.find_by(params[:data_item_id])
	# 	@content_items = @data_item.content_items
	# end

	def index
		# @artist =Artist.find_by(id: params[:artist_id])
		@data_item =DataItem.find_by(id: params[:data_item_id])
		@content_items = @data_item.content_items
	end
end
