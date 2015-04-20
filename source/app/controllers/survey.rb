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
        # ILUVU: unless question_content.empty?
        if question_content != ""
          new_survey.questions.create(content: question_content)
        end
      end
      question = new_survey.questions.first # ILUVU: Won't this add every option to the first question of the survey? Does that seem like a problem?
      params[:option].each_value do |option_content|
        if option_content != ""
          question.options.create(content: option_content)
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

  # ILUVU: should @survey go inside of the if block, since we don't need it unless we find the SurveyUser?
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
  survey.questions.each do |question| # ILUVU: Maybe an each_with_index?
    count_sym = count.to_s.to_sym # ILUVU: Does this really need to take the form of a symbol?
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
