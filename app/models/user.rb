class User < ActiveRecord::Base
  has_secure_password

  has_many :lists
  has_many :tasks, through: :lists

  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  validates :email, format: { with: /[@][a-z]+[.][a-z]{3}/, message: "must be in valid format" }
  validates :password, length: { minimum: 6 }
end
