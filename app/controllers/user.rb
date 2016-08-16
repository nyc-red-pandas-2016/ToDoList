post '/users' do
  new_user = User.new(params[:user])
  if new_user.save
    session[:user_id] = new_user.id
    redirect "/users/#{new_user.id}"
  else
    new_user.errors.full_messages.join("<br>")
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
