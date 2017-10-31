class Doctor < ApplicationRecord

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :address, presence: true
  validates :gender, presence: true

end
