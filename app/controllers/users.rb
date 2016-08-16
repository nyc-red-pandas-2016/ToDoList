get '/users/:id' do
  erb :'/users/index'
end

get '/register' do
  erb :'/users/register'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :"/users/register"
  end
end
