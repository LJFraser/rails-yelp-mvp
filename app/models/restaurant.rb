class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  CATEGORY = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, :address, :category, :phone_number, presence: true
  # validates :category as: CATEGORY

end
