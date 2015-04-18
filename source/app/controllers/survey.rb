get '/' do
  @surveys = Survey.all
  erb :index
end

get '/surveys' do
  redirect '/'
end

get '/surveys/new' do
  erb :'surveys/new'
end

post '/surveys' do
  new_survey = Survey.new(
    title: params[:title],
    user_id: current_user.id
    )

  if new_survey.save
    redirect "/users/#{current_user.id}"
  else
    [500, "Sorry, something went wrong!"]
  end
end

#debbie
get '/surveys/:id' do |id|
  @survey = Survey.find(id)
  @questions = @survey.questions
  erb :'surveys/show'
end

post '/surveys/:id' do |id|
  survey = Survey.find(id)
  current_user.taken_surveys << survey
  count = 1
  survey.questions.each do |question|
    option = Option.find_by(content: params[count.to_s.to_sym], question_id: question.id)
    Answer.create(option_id: option.id, user_id: current_user.id)
    count +=1
  end
  redirect :'/'
end

get '/surveys/:id/edit' do |id|
  erb :'surveys/edit'
end

put '/surveys/:id' do |id|
  'edit a survey!!'
end

delete '/surveys/:id' do |id|
  survey_to_delete = Survey.find(id)
  survey_to_delete.destroy
  redirect "/users/#{current_user.id}"
end

get '/surveys/:id/stats' do |id|
  @survey = Survey.find(id)
  erb :'surveys/_stats'
end
