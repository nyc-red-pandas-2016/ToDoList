def logged_in?
  return true if session[:user_id]
  false
end

def get_session_user
  if session[:user_id]
    return User.find(session[:user_id])
  else
    return nil
  end
end

# def authenticate_user(args = {})
#   user =
# end
