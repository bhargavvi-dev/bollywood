class Admin::DataItemsController <  ApplicationController


	def index 
    if user_signed_in?   
    @data_items = current_artist.data_items
  else
    redirect_to user_session_path
  end
end

	def new
    @data_item = DataItem.new
  end

  def edit
  	@data_item = current_artist.data_items.find(params[:id])
  end

  def show
  	@data_item = current_artist.data_items.find(params[:id])
  end

  def create
    @data_item = current_artist.data_items.new(data_item_params)
  
    if @data_item.save
      flash[:success] = "Data Item Added to #{current_artist.real_name}"
      redirect_to admin_data_item_path(@data_item)
    else
      render 'new'  
    end
  end

  def update
  	@data_item = current_artist.data_items.find(params[:id])
  	if @data_item.update(data_item_params)
      flash[:notice] = "Data Item updated"
    	redirect_to admin_data_item_path(@data_item)
  	else
    	render 'edit'
  	end
  end
  def destroy
  	@data_item = current_artist.data_items.find(params[:id])
  	@data_item.destroy
    flash[:alert] = "Data Item Deleted"
  	redirect_to admin_data_items_path
	end

  private
 
   def data_item_params
     params.require(:data_item).permit(:type, :title, :is_active, :artist_id)
   end
end
