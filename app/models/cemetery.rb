class Cemetery < ApplicationRecord
  validates :title, presence: true, length: {minimum: 2}
  validates :description, length: {minimum: 5}
end
