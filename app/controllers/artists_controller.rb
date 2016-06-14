class ArtistsController < ApplicationController
  
  def index
  	redirect_to admin_data_items_path if current_artist
    @artists = Artist.all
  end
end
