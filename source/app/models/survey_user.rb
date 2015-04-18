class SurveyUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey

  validates_uniqueness_of :user_id, :scope => [:survey_id]
  validates_uniqueness_of :survey_id, :scope => [:user_id]

end
