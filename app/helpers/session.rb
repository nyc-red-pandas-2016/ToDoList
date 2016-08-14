def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def logged_in?
  redirect '/users/login' unless current_user
end
