class User < ApplicationRecord
  has_secure_password

  has_many :blogs, dependent: :destroy

  before_save { self.email = email.downcase }

  validates_presence_of :first_name
  validates :email, presence: true, uniqueness: true
end
