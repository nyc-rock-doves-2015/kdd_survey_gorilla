class User < ActiveRecord::Base
  has_secure_password
  has_many :authored_surveys, class_name: "Survey"
  has_many :survey_surveytakers
  has_many :taken_surveys, through: :survey_surveytakers, source: :survey
end
