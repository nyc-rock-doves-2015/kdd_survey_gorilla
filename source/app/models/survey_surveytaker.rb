class SurveySurveytaker < ActiveRecord::Base
  belongs_to :surveytaker, class_name: "User", foreign_key: :surveytaker_id
  belongs_to :survey
end
