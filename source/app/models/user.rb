class User < ActiveRecord::Base
  has_secure_password
  has_many :authored_surveys, class_name: "Survey"
  has_many :survey_users
  has_many :taken_surveys, through: :survey_users, source: :survey
end
