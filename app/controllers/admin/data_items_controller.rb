class Admin::DataItemsController <  ApplicationController

  before_filter :authenticate_user!
  before_action :set_data_item, only: [:show, :edit, :update, :destroy]
  before_action :set_content_type, only: [:show,:edit,:update,:destroy]
  before_action :set_metadata,only: [:index,:show,:update,:edit]
  
  def index
      @data_items = current_artist.data_items
  end

  def new
    @data_item = current_artist.data_items.new
    @newsmetadata = ContentMetadataNews.new
    @eventmetadata = ContentMetadataEvent.new
    @photometadata = ContentMetadataPhotoGallery.new
  end
  
  def create
    @data_item = current_artist.data_items.new(data_item_params)
    @type = @data_item.type
    if @data_item.save
      case @type
       when "News"
        @data_item.content_metadata_news.create(news_metadata_params)
       when"Event"
        @data_item.content_metadata_events.create(events_metadata_params)
       else
        @data_item.content_metadata_photo_galleries.create(photoes_metadata_params) 
      end
      redirect_to admin_data_item_path(@data_item), :success => "Data Item Added to #{current_artist.real_name}"
    else
      render 'new'  
    end
  end

  def update
    if @data_item.update(data_item_params)
       case @type
        when "News"
          @newsmetadata.update(news_metadata_params)
        when "Event"
          @eventmetadata.update(events_metadata_params)
        else
          @photometadata.update(photoes_metadata_params)
        end   
    redirect_to admin_data_item_path(@data_item),:notice => "Data Item updated"
  	else
    	render 'edit'
  	end
  end
  
  def destroy
   	@data_item.destroy
   	redirect_to admin_data_items_path,:alert => "Data Item Deleted"
	end

  private
   
   def set_data_item
    @data_item = current_artist.data_items.find(params[:id])
   end 
   
   def set_content_type
    @type = DataItem.find(params[:id]).type
   end

   def set_metadata
      case type = @type
      when "News"
        @newsmetadata = ContentMetadataNews.find_by(data_item_id: params[:id])
      when "Event"
        @eventmetadata = ContentMetadataEvent.find_by(data_item_id: params[:id]) 
      when
        @photometadata = ContentMetadataPhotoGallery.find_by(data_item_id: params[:id])
      end
    end
 
   def data_item_params
     params.require(:data_item).permit(:type, :title, :is_active, :artist_id)
   end

   def news_metadata_params
     params[:data_item].require(:content_metadata_news).permit(:author,:publisher,:issue_date)
   end
   
   def events_metadata_params
     params[:data_item].require(:content_metadata_event).permit(:organisers,:location,:date)
   end
   
   def photoes_metadata_params
     params[:data_item].require(:content_metadata_photo_gallery).permit(:author,:dimensions)
   end
end