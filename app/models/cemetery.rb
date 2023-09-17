class Cemetery < ApplicationRecord
  has_many :graves, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: {minimum: 2}
  validates :description, length: {minimum: 5}
end
