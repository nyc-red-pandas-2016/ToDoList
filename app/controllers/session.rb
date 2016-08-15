post '/sessions' do

  user = User.find_by(username: params[:user][:username])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  elsif user
    @errors = "Incorrect Password for #{user.username}"
  else
    @errors = "Invalid Username "
  end

  erb :'index'
end


get '/login' do
  erb :'sessions/login'
end

get '/logout' do
  session.clear
  redirect '/'
end
