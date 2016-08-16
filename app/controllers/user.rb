post '/users' do
  @errors = nil

  new_user = User.new(params[:user])
  if new_user.save && request.xhr?
    session[:user_id] = new_user.id
    content_type :json
    {redirect: true,  url: "/users/#{new_user.id}"}.to_json
  elsif request.xhr?
    new_user.errors.full_messages.join("<br>")
  else
    @errors = new_user.errors.full_messages
    erb :'users/new'
  end

end

get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
 @user = get_session_user
 redirect '/' unless logged_in? && @user == User.find(params[:id])
 erb :'users/show'
end

get '/users' do

  @users = User.all
  erb :'users/index'
end

put '/users/:id' do

  @user = User.find(params[:id]) || nil
  redirect '/' unless @user == get_session_user
  erb :'users/edit'
end
