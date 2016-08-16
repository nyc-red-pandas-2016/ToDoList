get '/lists/:id/tasks' do
  # @user = User.find(current_user)
  # @list = @user.lists.last
  @list = List.find(params[:id])
  @tasks= @list.tasks
  erb :'tasks/new' #should be tasks/index
end

get '/lists/:id/tasks/new' do
  @list = List.find(params[:id])
  erb :'tasks/new'
end


post '/lists/:id/tasks' do
  @list = List.find(params[:id])
  @task = @list.tasks.new(params[:task])#Task.new(params[:task])
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

put '/lists/:id/tasks/:id/status' do
  @task = Task.find(params[:id])
  @list = @task.list
  params[:complete] == 'true' ? @task.update(status: false) : @task.update(status: true)
  erb :'lists/show'
end

delete '/lists/:id/tasks/:id' do
  @list = Task.find(params[:id]).list
  Task.find(params[:id]).destroy
  redirect "/lists/#{@list.id}"
end
