class Admin::DataItemsController <  ApplicationController

  before_filter :authenticate_user!
  before_action :set_data_item, only: [:show, :edit, :update, :destroy]

  def index
      @data_items = current_artist.data_items
  end

  def new
    @data_item = current_artist.data_items.new
  end
  def create
    @data_item = current_artist.data_items.new(data_item_params)
    if @data_item.save
      redirect_to admin_data_item_path(@data_item), :success => "Data Item Added to #{current_artist.real_name}"
    else
      render 'new'  
    end
  end

  def update
  	if @data_item.update(data_item_params)
      redirect_to admin_data_item_path(@data_item),:notice => "Data Item updated"
  	else
    	render 'edit'
  	end
  end
  
  def destroy
  	@data_item.destroy 
  	redirect_to admin_data_items_path,:alert => "Data Item Deleted"
	end
  def edit
  end

  def show    
  end



  private
   
   def set_data_item
    @data_item = current_artist.data_items.find(params[:id])  
   end 
 
   def data_item_params
     params.require(:data_item).permit(:type, :title, :is_active, :artist_id)
   end
end
