def current_user
  session[:user_id]
end

def current_user_name
  User.find(current_user).username
end

def require_user
  redirect '/users/login' unless current_user
end
