get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    @user_lists = @user.lists
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ['Invalid username or password.']
    erb :'/users/login'
  end
end

get '/users/logout' do
  session.clear
  redirect '/'
end

get '/users/:id' do

  @user = User.find(params[:id])
  @lists = @user.lists
  # @tasks = @lists.tasks
   erb :'users/show'
end
