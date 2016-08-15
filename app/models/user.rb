class User < ActiveRecord::Base
  # Remember to create a migration!

  has_secure_password
  validates :username, :email, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 }



  has_many :lists
  has_many :tasks, through: :lists

end
