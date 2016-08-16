class User < ActiveRecord::Base
  has_secure_password

  has_many :lists
  has_many :tasks, { through: :lists }

  validates :username, :email, presence: true
  validates :username, uniqueness: true, length: { minimum: 3 }
  validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "invalid email address" }
  validates :password, length: { in: 6..20 }
end
