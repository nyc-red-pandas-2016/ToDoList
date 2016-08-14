class Task < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, :list_id, presence: true
  belongs_to :list
  belongs_to :user, through: :list

end
