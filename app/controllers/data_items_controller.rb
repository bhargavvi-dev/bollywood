class DataItemsController < ApplicationController
	def index
		@artist = Artist.find(params[:artist_id])
		@data_items = @artist.data_items
	end

end
