def current_user
  if session[:user_id]
    return User.find(session[:user_id])
  else
    return nil
  end
end

def empty_sign_up_field?(user_params)
  user_params.each_value do |param|
    return true if param == ""
  end
  return false
end
