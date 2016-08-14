def current_user
  session[:user_id]
end

def require_user
  redirect '/users/login' unless current_user
end