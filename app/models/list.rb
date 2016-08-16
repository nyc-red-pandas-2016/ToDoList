class List < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :tasks

  validates :list_name, presence: true
end
