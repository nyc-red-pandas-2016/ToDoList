post '/login' do

  user = User.find_by(username: params[:user][:username])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  elsif user
    "<br>Incorrect Password for #{user.username}"
  else
    "418"
  end

end


get '/login' do
  erb :'sessions/login'
end

get '/logout' do
  session.clear
  redirect '/'
end
