get '/users/:id' do |id|
  @user = User.find(id)
  erb :'users/show'
end
