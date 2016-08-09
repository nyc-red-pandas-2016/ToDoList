helpers do

  def current_user
      @current_user ||= User.find_by(:id=>session[:user_id])
  end

  def logged_in?
    !!current_user
  end


  def current_list
    @current_list ||= List.find_by(:id=>session[:list_id])
  end

end
