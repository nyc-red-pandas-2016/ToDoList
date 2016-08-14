class Task < ActiveRecord::Base
  belongs_to :list
  belongs_to :user
  has_many :tags, as: :tagable
end
