class DataItemsController < ApplicationController
	def index
		@artist = Artist.find_by(id:params[:artist_id])
		@data_items = @artist.data_items
	end

end
