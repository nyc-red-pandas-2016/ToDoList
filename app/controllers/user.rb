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
    redirect "/users/#{@user.id}"
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
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  erb :'users/show'
end

get '/logout' do
  session.clear
  redirect '/'
end
