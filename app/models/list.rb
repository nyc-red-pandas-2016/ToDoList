class List < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, :user_id, presence: true

  belongs_to :user
  has_many :tasks

end
