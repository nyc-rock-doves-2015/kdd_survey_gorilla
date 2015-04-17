class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :survey_surverytakers
  has_many :surveytakers, through: :survey_surverytakers, source: :user, foreign_key: :user_id, class_name: "User"
end
