class Admin::ArtistsController <  ApplicationController
  
  def index
    @artists = Artist.all
  end
  
  def new
  	@artist = Artist.new
  end

  def edit
  	@artist = Artist.find(params[:id])
  end

  def show
  	@artist = Artist.find(params[:id])
  end

  def create
  	@artist = Artist.new(artist_params)
 
  	if @artist.save
    	redirect_to @artist
  	else
    	render 'new'
  	end
  end

  def update
  	@artist = Artist.find(params[:id])
 
  	if @artist.update(artist_params)
    	redirect_to @artist
  	else
    	render 'edit'
  	end
  end

  def create
  	@artist = Artist.new(artist_params)
 
  	if @artist.save
    	redirect_to @artist
  	else
    	render 'new'
  	end
  end

  def destroy
  	@artist = Artist.find(params[:id])
  	@artist.destroy
 
  	redirect_to artists_index_path
	end

  private
  def artist_params
    params.require(:artist).permit(:real_name, :nick_name,:address, :dob,:hometown, :religion, :nationality)
  end

end
