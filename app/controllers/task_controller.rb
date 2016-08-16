get '/lists/:id/tasks/new' do
  @list = List.find(params[:id])
  erb :'/tasks/new'
end

post '/lists/:id/tasks' do
  task = Task.new(params[:task])
  if task.save
    redirect "/lists/#{task.list_id}"
  else
    @errors = user.errors.full_messages
    erb :'/tasks/new'
  end
end 

get '/tasks/:id/edit' do
  require_user
  @task = Task.find(params[:id])
  erb :'/tasks/edit'
end

put '/tasks/:id' do
  require_user
  @task = Task.find(params[:id])
  @task.assign_attributes(params[:task])
  if @task.save
    redirect "/lists/#{@task.list_id}"
  else
    erb :'/tasks/edit'
  end
end

delete '/tasks/:id' do
    temp = params[:task][:list_id]
    Task.find(params[:id]).destroy
    redirect "/lists/#{temp}"
end