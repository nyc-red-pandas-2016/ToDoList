class User < ActiveRecord::Base
  has_secure_password
  has_many :lists

  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: true
  validate :email_format

  def email_format
    if !email.include?("@") && !email.include?(".com")
      errors.add(:email, " must be in the proper format.")
    end
  end

  def pretty_time
    self.strftime("%b %d, 20%y")
  end

end
