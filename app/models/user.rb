class User < ActiveRecord::Base
  has_many :lists, dependent: :destroy
  has_secure_password
end
