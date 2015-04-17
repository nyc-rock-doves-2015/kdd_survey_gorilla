def current_user
  if session[:user_id]
    return User.find(session[:user_id])
  else
    return nil
  end
end

def user_params_valid?(user, user_params)
  user_params[:password] == user_params[:password_confirmation] && user.valid
end

