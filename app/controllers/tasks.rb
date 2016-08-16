get '/lists/:id/tasks/new' do
  redirect '/' unless logged_in?
  @list = List.find(params[:id])
  erb :'/tasks/new'
end

get '/lists/:id/tasks/:task_id/edit' do
  @task = Task.find(params[:task_id])
  erb :'/tasks/edit'
end

post '/tasks' do
  redirect '/' unless logged_in?
  @task = Task.new(params[:task])
  if @task.save
    redirect "/lists/#{@task.list_id}"
  else
    @errors = @task.errors.full_messages
    erb :'/tasks/new'
  end
end

put '/tasks/:id/complete' do
  @task = Task.find(params[:id])
  @task.update(completed: "true")
  redirect "/lists/#{@task.list_id}"
end

put '/lists/:id/tasks/:task_id' do
  @task = Task.find(params[:task_id])
  @task.update(params[:task])
  redirect "/lists/#{@task.list_id}"
end

delete '/tasks/:id' do
  @task = Task.find(params[:id])
  @task.destroy
  redirect "/lists/#{@task.list_id}"
end
