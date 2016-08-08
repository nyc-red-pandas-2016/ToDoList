class List < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :tasks
  validates :name,presence:true
end
