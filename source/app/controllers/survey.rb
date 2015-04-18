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
  if request.xhr?
    erb :'surveys/_new_question', layout: false
  else
     new_survey = Survey.new(
    title: params[:title],
    user_id: current_user.id
    )
  if new_survey.save
    params[:question].each_value do |question_content|
      if question_content != ""
        new_survey.questions.create(content: question_content)
      end
    end
    redirect profile_url(current_user)
  else
    flash[:error] = "Survey did not save!"
    redirect '/surveys/new'
  end

  end

end

#debbie

get '/surveys/:id' do |id|
  bounce_guest!
  @survey = Survey.find(id)
  surveyuser = SurveyUser.find_by(survey_id: @survey.id, user_id: current_user.id)
  if surveyuser.nil?
    @questions = @survey.questions
    erb :'surveys/show'
  else
    flash[:error] = "Sorry, you've already taken this survey."
    redirect profile_url(current_user)
  end
end


post '/surveys/:id' do |id|
  survey = Survey.find(id)
  surveyuser = SurveyUser.create(survey_id: survey.id, user_id: current_user.id)
  count = 1
  survey.questions.each do |question|
    count_sym = count.to_s.to_sym
    question.mark_answer(params[count_sym], current_user)
    count +=1
  end
  redirect profile_url(current_user)
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
  redirect profile_url(current_user)
end

get '/surveys/:id/stats' do |id|
  @survey = Survey.find(id)
  erb :'surveys/_stats'
end
