get '/tasks' do
  @user = User.find(current_user)
  @list = @user.lists.last
  erb :'tasks/new'
end

get '/tasks/new' do
  erb :'tasks/new'
end


post '/tasks' do
  @list = User.find(current_user).lists.last
  @task = Task.new(params[:task])
  if @task.save
    redirect "/lists/#{@list.id}"
  else
    @errors = @task.errors.full_messages
    erb :'tasks/new'
  end
end

get '/lists/:id/tasks/:id/edit' do
  @task = Task.find(params[:id])
  @list = @task.list
  erb :'tasks/edit'
end

put '/lists/:id/tasks/:id' do
  @task = Task.find(params[:id])
  @task.update(params[:task])
  redirect "/lists/#{params[:task][:list_id]}"
end

delete '/lists/:id/tasks/:id' do
  @list = Task.find(params[:id]).list
  Task.find(params[:id]).destroy
  redirect "/lists/#{@list.id}"
end
