class Option < ActiveRecord::Base
  belongs_to :question
  has_many :answers

  def num_of_answers
    (self.answers.count).to_f
  end

  def percentage_answered(num_of_takers)
    if num_of_takers == 0
      return 0
    else
      ((num_of_answers / num_of_takers) * 100).round
    end
  end
end
