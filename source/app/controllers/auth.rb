enable :sessions
get '/login' do
  if current_user
    redirect '/'
  else
    erb :'auth/login'
  end
end

post '/login' do
  user = User.find_by(name: params[:name])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    flash[:error] = "Could not find your account. Please try again."
    redirect '/login'
  end
end

get '/signup' do
  if current_user
    redirect '/'
  else
    erb :'auth/signup'
  end
end

post '/signup' do
  user = User.create(params[:user])
  if user_params_valid?(user, params[:user])
    session[:user_id] = user.id
    redirect '/'
  else
    flash[:error] = user.error_generator
    redirect '/signup' #with time, figure out how to render form with previous answers already filled in params
  end

end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
