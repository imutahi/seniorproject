class Service < ApplicationRecord
  has_and_belongs_to_many :firm, optional: true

  validates :service_type, length: { maximum: 100 }, presence: true
  validates :description, length: { maximum: 140 }, presence: true
  validates :price, length: { maximum: 20 }, presence: true
end
