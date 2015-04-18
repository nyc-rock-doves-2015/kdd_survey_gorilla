# Steven's theory

=begin theory
I really only want to see one redirect or render conditional in a
controller action.  It makes it simple for me to understand what's
going on.  Under some condition set we are happy, under another we 
are sad. I don't like multiple "conditional paths".
=end

post '/signup' do
  @user = User.new(params[:user])
  if user_params_are_valid? && @user.save # AKA: "something happy"
    session[:user_id] = user.id
    redirect '/'
  else # AKA: something NOT happy
    render '/signup' # set the default "value" fields for @user.key_name
  end
end

private

# The refactoring is "extract method"
def user_params_are_valid?
  flash[:error] = if empty_sign_up_field?(params[:user])
    "You need a username and a password to sign up. Please try again."
  elsif params[:user][:password] != params[:user][:password_confirmation]
    "Your passwords didn't match. Please try again."
  end
  !flash[:error]
end

def empty_sign_up_field?(user_params)
# use Enumerable all?
# AAaaaaannnnd once you get that nice, tight enumerable here, you might want to use
# the refactoring "INLINE METHOD" which would get rid of this method
end
