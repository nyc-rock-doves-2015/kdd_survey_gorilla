get '/users/:id' do |id|
<<<<<<< HEAD


=======
  @user = User.find(id)
  erb :'users/show'
>>>>>>> development
end
