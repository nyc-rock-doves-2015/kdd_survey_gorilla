class User < ActiveRecord::Base
  has_secure_password
  validates :password_digest, presence: true
  validates :name, presence: true, uniqueness: true
  has_many :authored_surveys, class_name: "Survey"
  has_many :survey_users
  has_many :taken_surveys, through: :survey_users, source: :survey

  def error_generator
    self.errors.full_messages.join(" ")
  end
end
