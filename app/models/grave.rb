class Grave < ApplicationRecord
  belongs_to :cemetery
  belongs_to :user

  validates :last_name, presence: true, length: {minimum: 1}
end
