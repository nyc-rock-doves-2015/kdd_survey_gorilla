class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :option

  # def self.log(survey)
  #   count = 1
  #   survey.questions.each do |question|
  #     option = Option.find_by(content: params[count.to_s.to_sym], question_id: question.id)
  #     if !option.nil?
  #       self.create(option_id: option.id, user_id: current_user.id)
  #     end
  #     count +=1
  #   end


end
