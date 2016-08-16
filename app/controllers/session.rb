post '/login' do

  user = User.find_by(username: params[:user][:username])

  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    # redirect "/users/#{user.id}"
    "no errors"
  elsif user
    "<br>Incorrect Password for #{user.username}"
  else
    "Invalid username"
  end

end


get '/login' do
  erb :'sessions/login'
end

get '/logout' do
  session.clear
  redirect '/'
end
