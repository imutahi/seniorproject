class Client < ApplicationRecord
  has_many :firms

  validates :client_name, length: { maximum: 40 }, presence: true
  validates :company, length: { maximum: 60 }
  validates :address, length: { maximum: 100 }
  validates :city, length: { maximum: 40 }
  validates :state,
            format: {with: %r{\A\w{2}\Z}}
  validates :zip,
            format: {with: %r{\A\d{5}\Z}}
  validates :phone,
            format: {with: %r{\A\d{3}-\d{3}-\d{4}\Z}}
  validates :fax,
            format: {with: %r{\A\d{3}-\d{3}-\d{4}\Z}}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
            #presence: true,
            length: {maximum: 40}
            #,uniqueness: {case_sensitive: false}
  validates :notes, length: { maximum: 140 }
end
