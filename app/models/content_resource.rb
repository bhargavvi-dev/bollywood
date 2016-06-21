class ContentResource < ActiveRecord::Base
	
	has_many :content_item_resource,:dependent => :destroy

	 has_attached_file :media,
                    styles: lambda { |a| a.instance.check_file_type}

   def check_file_type
    if is_image_type?
      { :medium => { :geometry => "2048x2048>",processors: [:thumbnail, :squish_to]},
      	:thumb =>  { :geometry => "960x960>" ,processors: [:thumbnail, :squish_to]}
      }
    elsif is_video_type?
      {
          :thumb => { :geometry => "100x100#", :format => 'mpeg', :time => 10,:processors => [:ffmpeg]},
          :medium => {:geometry => "250x150#", :format => 'mpeg', :time => 10,:processors => [:ffmpeg]}
      }
    else
      {}
    end
  end  

      def is_video_type?
		    media.content_type =~ %r(video)
		  end

		  def is_image_type?
		    media.content_type =~ %r(image)
		  end	

  validates_attachment_content_type :media, :content_type => [/\Aimage\/.*\Z/, /\Avideo\/.*\Z/]             

			# has_attached_file :media,
			# :styles => {
   #          :medium => { :geometry => "640x480", :format => 'mp4'},
   #          :thumb => {:geometry => "100x100#", :format => 'mp4', :time => 10}
   #      },  :processors => [:ffmpeg],
   #      	  :if => :is_type_of_video?

   #  has_attached_file :media, styles: { medium: "300x300>", thumb: "100x100>"},:processors => [:custom] 

      
			# validates_attachment_content_type :media,
		 #     :content_type => ['image/png', 'image/jpeg', 'image/jpg', 'image/gif'],
		 #     :message => "Different error message",
		 #     :if => :is_type_of_image?

				# has_attached_file :media, :styles => {
				#   res2048:  "2048x2048>",
				#   res960:   "960x960>"
				# },
				# processors: [:thumbnail, :squish_to]

				# validates_attachment_content_type :media, content_type: [ 'image/jpg', 'image/jpeg', "image/png", "image/gif"]
				# validates_attachment_size :media, less_than: 8.megabytes
				# validates_attachment_presence :media
			end
