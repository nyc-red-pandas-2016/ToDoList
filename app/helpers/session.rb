def current_user
  @current_user ||= User.find(session[:user_id])
end

def require_user
  redirect '/users/login' unless @current_user
end