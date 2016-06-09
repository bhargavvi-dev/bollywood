class Admin::DataItemsController <  ApplicationController

	def index
    artist_id = current_user.artists.first
    @data_items = DataItem.all.where(:artist_id => artist_id)
  end

	def new
    @data_item = DataItem.new
  end

  def edit
  	@data_item = DataItem.find(params[:id])
  end

  def show
  	
  	@data_item = DataItem.find(params[:id])
  end

  def create
    artist = current_user.artists.last

    @data_item = artist.data_items.new(data_item_params)
  
    if @data_item.save
      redirect_to admin_data_item_path(@data_item)
    else
      render 'new'  
    end
  end

  def update
  	@data_item = DataItem.find(params[:id])
 
  	if @data_item.update(data_item_params)
    	redirect_to admin_data_item_path(@data_item)
  	else
    	render 'edit'
  	end
  end
  def destroy
  	@data_item = DataItem.find(params[:id])
  	@data_item.destroy
 
  	redirect_to admin_data_items_path
	end

  private
   def data_item_params
     params.require(:data_item).permit(:type, :title, :is_active, :artist_id)
   end
end
