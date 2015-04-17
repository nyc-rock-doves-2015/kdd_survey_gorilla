get '/' do
  erb :index
end

get '/surveys' do
  redirect '/'
end

get '/surveys/new' do
  erb :'surveys/new'
end

post '/surveys' do
  'create a new survey!'
end

get '/surveys/:id' do |id|
  erb :'surveys/show'
end

get '/surveys/:id/edit' do |id|
  erb :'surveys/edit'
end

put '/surveys/:id' do |id|
  'edit a survey!!'
end

delete '/surveys/:id' do |id|
  'delete the survey!!'
end

get '/surveys/:id/stats' do |id|
  erb :'surveys/stats'
end
