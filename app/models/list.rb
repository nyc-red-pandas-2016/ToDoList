class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  # Remember to create a migration!
end
