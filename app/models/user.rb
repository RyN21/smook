class User < ApplicationController
  validates_presence_of :username, :first_name
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, on: :create

  has_secure_password
end
