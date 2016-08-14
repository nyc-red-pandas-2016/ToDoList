class Tag < ActiveRecord::Base
  belongs_to :user
  belongs_to :tagable, polymorphic: true
end
