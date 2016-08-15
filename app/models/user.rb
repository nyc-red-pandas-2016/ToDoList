class User < ActiveRecord::Base
  has_many :lists
  has_many :tasks, through: :lists

  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  validates :email, format: {with: /\A\w+@\w+[.]\w+\z/i, message: "must be valid email address."}
  validates :password, length: { minimum: 6 }

  has_secure_password
end
