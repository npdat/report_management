class Upload < ActiveRecord::Base
	has_attached_file :pdf,
					  #:styles => { :medium => "300x300>",:thumb => "100x100>" }
  #:path => ":rails_root/public/:attachment/:id_partition/:style/:basename.:extension",
      #:url => "/:attachment/:id_partition/:style/:basename.:extension"
  :path => ":rails_root/public/:attachment/:id_partition.:extension",
  :url => "/:attachment/:id_partition.:extension"

  validates_attachment :pdf,
  						 :presence => true,
  						 #:content_type => { :content_type => /\Aimage\/.*\Z/ },
               :content_type => { :content_type => ["application/pdf"] },
  						 :size => { :less_than => 10.megabyte }
end

