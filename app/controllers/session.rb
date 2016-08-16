post '/login' do

  user = User.find_by(username: params[:user][:username])

  if user && user.authenticate(params[:user][:password]) && request.xhr?
    session[:user_id] = user.id
    content_type :json
    {redirect: true,  url: "/users/#{user.id}"}.to_json
  elsif user && request.xhr?
    "Incorrect Password"
  elsif request.xhr?
    "Invalid username"
  elsif user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ['Invalid Credentials']
    erb :'index'
  end


end


get '/login' do
  erb :'sessions/login'
end

get '/logout' do
  session.clear
  redirect '/'
end
