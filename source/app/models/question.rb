class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :options

  def mark_answer(option_content, user)
    option = Option.find_by(content: option_content, question_id: self.id)
    if !option.nil?
      Answer.create(option_id: option.id, user_id: user.id)
    end
  end


end
