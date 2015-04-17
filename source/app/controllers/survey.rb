get '/' do
  @surveys = Survey.all
  erb :index
end

get '/surveys' do
  redirect '/'
end

get '/surveys/new' do

  erb :'surveys/single'
end

post '/surveys' do

end

get '/surveys/:id' do |id|

end

get '/surveys/:id/edit' do |id|

end

put '/surveys/:id' do |id|

end

delete '/surveys/:id' do |id|

end

get '/surveys/:id/stats' do |id|

end
