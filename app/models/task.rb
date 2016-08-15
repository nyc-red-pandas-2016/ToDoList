class Task < ActiveRecord::Base
  belongs_to :list
  belongs_to :user, through: :list
  # Remember to create a migration!
end
