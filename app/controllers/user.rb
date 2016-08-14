post '/users' do
  if new_user = User.create(params[:user])
    session[:user_id] = new_user.id
    redirect "/users/#{new_user.id}"
  else

  end

end

get '/users/:id' do

 "welcome user number #{params[:id]}"

end


get '/users' do


end


put '/users/:id' do

end
