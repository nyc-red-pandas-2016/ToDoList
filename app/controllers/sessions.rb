get '/login' do
  erb :'/sessions/login'
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user.authenticate(params[:password])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Wrong Username or Password"]
    erb :"/login"
  end
end
