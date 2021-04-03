class Firm < ApplicationRecord
  belongs_to :client, optional: true
  has_and_belongs_to_many :services

  validates :first_name, presence: true, length: { maximum: 60 }
  validates :middle_name, length: { maximum: 60 }
  validates :last_name, presence: true, length: { maximum: 60 }
  validates :maiden_name, length: { maximum: 60 }
  validates :dob,
            format: {with: %r{\A\d{2}-\d{2}-\d{4}\Z}},
            presence: true
  validates :ssn,
            format: {with: %r{\A\d{3}-\d{2}-\d{4}\Z}}
            #,uniqueness: {case_sensitive: false}
  validates :dl_number, length: { maximum: 40 }
  validates :dl_state,
            format: {with: %r{\A\w{2}\Z}}
  validates :notes, length: { maximum: 100 }
  mount_uploader :file, PdfUploader
end
