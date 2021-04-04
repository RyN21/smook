class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :first_name
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: { case_sensitive: true }, on: :create

  has_secure_password

  def name
    if !last_name.nil?
      first_name.concat(" #{last_name}")
    else
      first_name
    end
  end
end
