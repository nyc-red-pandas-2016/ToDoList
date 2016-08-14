class Task < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :list

  validates :description, presence:true

  def completed
    if self.complete == nil || self.complete == false
      self.update_attributes(:complete=>true)
    else
      self.update_attributes(:complete=>false)
    end
  end
end
