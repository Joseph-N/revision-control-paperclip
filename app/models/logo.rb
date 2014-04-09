class Logo < ActiveRecord::Base
	versioned

	has_attached_file :image,  :keep_old_files => true,
					  :styles => { :medium => "400x400#" },
					  :url => "/assets/logos/:id/versions/:version/:style/:basename.:extension",
    				  :path => ":rails_root/public/assets/logos/:id/versions/:version/:style/:basename.:extension"

    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

    # keep versions
  	Paperclip.interpolates :version do |attachment, style|
    	attachment.instance.version.to_s
  	end
end
