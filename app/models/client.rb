class Client < ApplicationRecord
  validates :client_name, length: { maximum: 40 }, presence: true
  validates :company, length: { maximum: 60 }
  validates :address, length: { maximum: 100 }
  validates :city, length: { maximum: 40 }
  validates :state, length: { maximum: 40 }
  validates :zip, length: { maximum: 40 }
  validates :phone, length: { maximum: 40 }
  validates :fax, length: { maximum: 40 }
  #validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
  #          presence: true,
  #          length: {maximum: 40},
  #          uniqueness: {case_sensitive: false}
  validates :notes, length: { maximum: 140 }
end
