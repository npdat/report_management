class AddAttachmentPdfToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :pdf
    end
  end

  def self.down
    drop_attached_file :uploads, :pdf
  end
end
