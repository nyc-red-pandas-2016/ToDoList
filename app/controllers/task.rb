#Show all tasks for list
get '/lists/:id/tasks' do
  @list = List.find(params[:id])
  @tasks= @list.tasks
  erb :'lists/show' #should be index instead of show
end

#Creating new task route
get '/lists/:id/tasks/new' do
  @list = List.find(params[:id])
  if request.xhr?
    erb :'tasks/_new_task_form_wrapper', layout:false
  else
    erb :'tasks/new'
  end
end


post '/lists/:id/tasks' do
  @list = List.find(params[:id])
  @task = @list.tasks.new(params[:task])
  if @task.save
    if request.xhr?
      erb :'tasks/_new_task_item', layout: false, locals: {list: @list, task: @task}
    else
      redirect "/lists/#{@list.id}/tasks"
    end
  else
    @errors = @task.errors.full_messages
    erb :'tasks/new'
  end
end

#Editing a task route
get '/lists/:id/tasks/:id/edit' do
  @task = Task.find(params[:id])
  @list = @task.list
  erb :'tasks/edit'
end

put '/lists/:id/tasks/:id' do
  @task = Task.find(params[:id])
  @task.update(params[:task])
  redirect "/lists/#{params[:task][:list_id]}/tasks"
end

#Change a tasks status
put '/lists/:id/tasks/:id/status' do
  @task = Task.find(params[:id])
  @list = @task.list
  params[:complete] == 'true' ? @task.update(status: false) : @task.update(status: true)
  erb :'lists/show'
end

#Delete a task
delete '/lists/:id/tasks/:id' do
  @list = Task.find(params[:id]).list
  Task.find(params[:id]).destroy
  if request.xhr?
    "true"
  else
  redirect "/lists/#{@list.id}/tasks"
  end
end
