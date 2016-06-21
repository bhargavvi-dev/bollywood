class ContentResource < ActiveRecord::Base

    has_many :content_item_resource,:dependent => :destroy
	  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>=" }
	  validates_attachment_content_type :photo,:content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    # has_attached_file :video, :processors => [:ffmpeg]
    # validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/

			 has_attached_file :media,
                    styles: lambda { |a| a.instance.check_file_type}
		  
	def check_file_type
    if is_image_type?
    	{
		  		validates_attachment_content_type :media,
		     :content_type => ['image/png', 'image/jpeg', 'image/jpg', 'image/gif'],
		     :message => "Different error message",
		   }
		elsif is_video_type?
			{
		  	validates_attachment_content_type :media,
		    :content_type => ['video/mp4'],
		    :message => "Sorry, right now we only support MP4 video",
		    :if => :is_type_of_video?,
		    :processors => [:ffmpeg]
		   }

		  protected
		  def is_video_type?
		    media.content_type =~ %r(video)
		  end

		  def is_image_type?
		    photo.content_type =~ %r(image)
		  end	
end
  