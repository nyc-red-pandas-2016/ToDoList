class Task < ActiveRecord::Base
	belongs_to :user
	belongs_to :list

    validates :name, :description, :list_id, :user_id, presence: true
end
