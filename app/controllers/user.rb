get '/' do
  erb :index
end

get '/users/login' do
  erb :'users/login'
end

put '/users' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Invalid username or password"]
    erb :'users/login'
  end
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  erb :'users/show'
end

get '/users/logout' do
  require_user
  session.clear
  redirect '/'
end