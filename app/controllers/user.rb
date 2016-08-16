# User Login and Authentication Routes
get '/users/login' do
  erb :'users/login'
end

put '/users' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Invalid username or password"]
    erb :'users/login'
  end
end

#User Registration Routes
get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

#User Page
get '/users/:id' do
  erb :'users/index' #should be 'users/index' same thing
end

#User Logout
get '/logout' do
  session.clear
  redirect '/'
end
