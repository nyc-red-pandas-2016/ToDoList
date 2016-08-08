class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password
  has_many :lists
  validates :username,:full_name,presence:true
end
