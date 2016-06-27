class DataItemsController < ApplicationController
	
	def index
		@artist = Artist.find(params[:artist_id])
		@data_items = @artist.data_items.is_active
		if params[:data_item].present?
  			@data_items = @artist.data_items.is_active.where(:type => params[:data_item][:type])
  		end
	end
end
