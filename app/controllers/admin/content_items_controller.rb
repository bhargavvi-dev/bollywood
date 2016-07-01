class Admin::ContentItemsController < ApplicationController
 before_filter :authenticate_user!
  before_action :set_data_item
  before_action :set_content_item,only: [:show, :edit, :update, :destroy]

 	def index
    @content_items = @data_item.content_items
	end

	def new
    @content_item = @data_item.content_items.new
    if @data_item.content_metadata_news.present?
       @newsmetadata = ContentMetadataNewsi18n.new
    elsif @data_item.content_metadata_events.present?
      @eventmetadata = ContentMetadataEventi18n.new
    else
      @photometadata = ContentMetadataPhotoGalleryi18n.new
    end
  end

  def create
    @content_item = @data_item.content_items.new(content_item_params)
    if @content_item.save
      if @data_item.content_metadata_news.present?
        news = @data_item.content_metadata_news.find_by(params[:data_item_id])
        news.content_metadata_newsi18ns.create(language_code: news_metadata_params["language_code"],title: content_item_params["title"])
      elsif @data_item.content_metadata_events.present?
        event = @data_item.content_metadata_events.find_by(params[:data_item_id])
        event.content_metadata_eventi18ns.create(language_code: event_metadata_params["language_code"],title: content_item_params["title"])
      else
        photo = @data_item.content_metadata_photo_galleries.find_by(params[:data_item_id])
        photo.content_metadata_photo_galleryi18ns.create(language_code: photo_metadata_params["language_code"],title: content_item_params["title"])
      end
      redirect_to admin_data_item_content_items_path(@data_item),:notice => "Content Item Added to #{@data_item.title}"
    else
      render 'new'  
    end
  end

  def update
  	if @content_item.update(content_item_params)
    	redirect_to admin_data_item_content_items_path, :notice => "Content Item update"
  	else
    	render 'edit'
  	end
  end

  def destroy
  	@content_item.destroy 
    redirect_to admin_data_item_content_items_path, :alert => "Content Item Deleted"
    # if @data_item.content_metadata_news.present?
    #   news = @data_item.content_metadata_news.find_by(params[:data_item_id])
    #   @newsmetadata= news.content_metadata_newsi18ns.find_by(params[:content_metadata_newsi18n_id])  
    # elsif @data_item.content_metadata_events.present?
    #   event = @data_item.content_metadata_events.find_by(params[:data_item_id])
    #   @eventmetadata = event.content_metadata_eventi18ns.find_by(params[:content_metadata_eventi18n_id])  
    # else
    #   photo = @data_item.content_metadata_photo_galleries.find_by(params[:data_item_id])
    #   @photometadata = photo.content_metadata_photo_galleryi18ns.find_by(params[:content_metadata_photo_galleryi18n_id])  
    # end
  end
  def show
  end
  
  private
  def set_data_item
  	@data_item = current_artist.data_items.find(params[:data_item_id])
  end
  
  def set_content_item
    @content_item = @data_item.content_items.find(params[:id])
  end

  def content_item_params
    params.require(:content_item).permit(:title, :description)
  end
  def news_metadata_params
   params[:content_item].require(:content_metadata_newsi18n).permit(:language_code) 
  end
  def event_metadata_params
   params[:content_item].require(:content_metadata_eventi18n).permit(:language_code) 
  end
  def photo_metadata_params
   params[:content_item].require(:content_metadata_photo_galleryi18n).permit(:language_code) 
  end 
end 

