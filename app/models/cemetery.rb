class Cemetery < ApplicationRecord
  has_many :graves, dependent: :destroy

  validates :title, presence: true, length: {minimum: 2}
  validates :description, length: {minimum: 5}
end
