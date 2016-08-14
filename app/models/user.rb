class User < ActiveRecord::Base
  has_many :lists
  has_many :tasks
  has_many :tags

  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A\w+@\w+[.]\w+\z/, message: "must be a valid e-mail address."}
  validates :password, length: {minimum: 6}, format: {with: /[A-Z]/, message: "must have at least one capital letter."}
end
