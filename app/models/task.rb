class Task < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :list
  belongs_to :user

  validates :task_name, presence: true
end
