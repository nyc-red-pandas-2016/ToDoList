class Task < ActiveRecord::Base
  belongs_to :list
  # Remember to create a migration!
end
