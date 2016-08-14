post '/sessions' do

  if user = User.find_by(params[:user])
    redirect "/users/#{user.id}"
  else
  end

end


get '/logout' do
  session.cleaer
  redirect '/'
end
