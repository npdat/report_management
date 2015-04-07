class Report < ActiveRecord::Base
  has_many :private_messages
  belongs_to :user
  attr_accessor :upload


  def self.search(search, user_id)
    if search
      if search == ''
        return
      else
        where("reportname like '%s'", "%#{search}%")
      end
    else
      if user_id
        where("user_id = '%i'", user_id)
      end
    end
  end

  def self.upload(upload)
    path = nil
    if  !upload.nil?
      file_name = upload.original_filename
      file = upload.read
      file_type = file_name.split('.').last
      if file_type == "pdf"
        new_name_file = Time.now.to_i
        name_folder = new_name_file
        new_file_name_with_type = "#{new_name_file}." + file_type

        #image_root = Rails.root + 'app/assets/reports/'
        image_root = "public/uploads/"
        #path = image_root + "#{name_folder}/" + new_file_name_with_type
        path = image_root + "/" + new_file_name_with_type

        #Dir.mkdir(image_root + "#{name_folder}");
        #Dir.mkdir(image_root);
        File.open(path, "wb")  do |f|
          f.write(file)
        end
      else
        path = "invalid"
      end
    end

    return path
  end
end
