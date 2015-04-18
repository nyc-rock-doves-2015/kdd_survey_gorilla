get '/options/new' do
  if request.xhr?
    erb :'surveys/_new_option', layout: false
  end
end
