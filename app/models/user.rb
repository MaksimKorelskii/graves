# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { user: 0, moderator: 1, admin: 2 }, _suffix: :role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cemeteries, dependent: :destroy
  has_many :graves, dependent: :destroy

  # It do devise :validatable
  #   validates :email, presence: true, uniqueness: true,
  #                     format: { with: URI::MailTo::EMAIL_REGEXP }
end
