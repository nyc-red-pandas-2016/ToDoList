get '/users/register' do
  erb:'user/new'
end

post '/users/register' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb:'user/new'
  end
end

get '/users/login' do
  erb:'user/login'
end

post '/users/login' do
  user = User.find_by(email: params[:user][:email])
  if user
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect "/"
    else
      @errors = ["Invalid password"]
      erb:'user/login'
    end
  else
    @errors = ["We do not recognize this email address."]
    erb:'user/login'
  end
end

get '/users/logout' do
  session.clear
  redirect '/'
end

get '/users/:id' do
  @user = User.find(params[:id])
  @lists = @user.lists
  @completed_tasks = @user.tasks.where(complete: true)
  @pending_tasks = @user.tasks.where(complete: false)
  erb:'user/show'
end