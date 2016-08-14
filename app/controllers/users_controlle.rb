get '/user/:id' do
    @user = User.find(params[:id])
    halt("401 error redirect to access denide")  unless  @user == current_user
    erb :'users/show'
end

get '/users/new' do
    redirect "/user/#{current_user.id}" if logged_in?
    erb :"users/new"
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
     @errors = @user.errors.full_messages
     erb :"users/new"
  end
end
