# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cemeteries, dependent: :destroy
  has_many :graves, dependent: :destroy

  validates :email, presence: true, uniqueness: true, 
            format: { with: URI::MailTo::EMAIL_REGEXP }

  def name_or_email
    self.name == '' ? self.email.split('@')[0].capitalize : self.name
  end
end
