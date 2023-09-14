class Grave < ApplicationRecord
  belongs_to :cemetery

  validates :last_name, presence: true, length: {minimum: 1}
end
