get '/lists/new' do
  erb :'/lists/create'
end

post '/lists' do
  list= List.new(params[:list])

  if list.save
    redirect '/'
  else
    @errors = list.errors.full_messages
    erb :'/lists/create'
  end
end

get '/lists/:id' do
  @list= List.find(params[:id])
  @tasks= @list.tasks
  erb :'/lists/show'
end

get '/lists/:id/edit' do
  @list= List.find(params[:id])
  erb :'lists/edit'
end

put '/lists/:id' do
  @list = List.find(params[:id])
  @list.assign_attributes(params[:list])
  if @list.save
    redirect "/lists/#{@list.id}"
  else
    erb :'lists/edit'
  end
end

delete '/lists/:id' do
  List.find(params[:id]).destroy
  redirect "/users/profile/#{current_user}"
end
