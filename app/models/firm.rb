class Firm < ApplicationRecord

  validates :first_name, presence: true, length: { maximum: 60 }
  validates :middle_name, length: { maximum: 60 }
  validates :last_name, presence: true, length: { maximum: 60 }
  validates :maiden_name, length: { maximum: 60 }
  validates :dob, presence: true, length: { maximum: 40 }
  validates :ssn,
            format: {with: %r{\A\d{3}-\d{2}-\d{4}\Z}}
            #,uniqueness: {case_sensitive: false}
  validates :dl_number, length: { maximum: 40 }
  validates :dl_state, length: { maximum: 40 }
  validates :notes, length: { maximum: 100 }
end
