# frozen_string_literal: true

class Grave < ApplicationRecord
  include Authorship

  belongs_to :cemetery
  belongs_to :user

  validates :last_name, presence: true, length: { minimum: 1 }
end
