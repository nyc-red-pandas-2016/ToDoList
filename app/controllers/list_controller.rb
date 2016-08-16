get '/lists/new' do
  erb :'/lists/add_list'
end

get '/lists/:id' do
  require_user
  @list = List.find(params[:id])
  @tasks = @list.tasks
  erb :'/lists/display'
end

get '/lists' do
  erb :lists
end

post '/lists' do
  list = List.new(params[:list])
  if list.save
    redirect "/lists/#{list.id}"
  else
    @errors = list.errors.full_messages
    erb :'/lists/new'
  end
end

get '/lists/:id/edit' do
  @list = List.find(params[:id])
  erb :'lists/edit'
end

put '/lists/:id' do
  require_user
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
    redirect "/users/#{current_user.id}"
end