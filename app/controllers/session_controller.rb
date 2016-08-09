get '/login' do
  erb :"index"
end

post '/sessions' do
  @user = User.find_by(:username => params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/user/#{current_user.id}"
  else
    @errors = ['Username / Password is invalid']
    erb :"/index"
  end

end

get '/logout' do
  session.clear
  redirect '/'
end
