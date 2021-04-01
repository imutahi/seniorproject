class Download < ApplicationRecord
  validates :title, presence: true, length: { maximum: 10 }
  mount_uploader :file, PdfUploader
end
