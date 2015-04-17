require "faker"

user = User.create(name: "admin", password: "password")


user1 = User.create(name: "other", password: "password")



5.times do
  survey = Survey.create(title: Faker::Company.catch_phrase, user_id: 1)
  5.times do
    question = survey.questions.create(content: Faker::Company.bs)
    2.times do
      question.options.create(content: Faker::Lorem.sentence)
    end
  end
end


5.times do
  survey = Survey.create(title: Faker::Company.catch_phrase, user_id: 2)
  5.times do
    question = survey.questions.create(content: Faker::Company.bs)
    2.times do
      question.options.create(content: Faker::Lorem.sentence)
    end
  end
end

5.times do
  user.taken_surveys << Survey.find(rand(1..10))
end
