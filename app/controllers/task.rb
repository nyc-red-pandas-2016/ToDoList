get '/tasks/:id' do
  if logged_in?
    @task = Task.find(params[:id])
    erb :'/tasks/show'
  else
    redirect '/users/new'
  end
end

get '/tasks/:id/edit' do
  @task = Task.find(params[:id])
  erb :'tasks/edit'
end

put '/tasks/:id' do
  if logged_in?
    @task = Task.find(params[:id])
    @task.assign_attributes(params[:task])

    if @task.save
        redirect "/tasks/#{@task.id}"
    else
        erb :'tasks/edit'
    end
  else
    redirect '/users/new'
  end
end

delete '/tasks/:id' do
    @task = Task.find(params[:id])
    list_id = @task.list.id
    Task.find(params[:id]).destroy
    redirect "/lists/#{list_id}"
end
