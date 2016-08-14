class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :lists
  has_many :tasks, through: :lists
  has_secure_password
end
