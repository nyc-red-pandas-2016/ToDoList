post '/tasks/create' do
  @task= Task.new(params[:task])
  if request.xhr?
    if @task.save
      content_type :json
      @task.to_json
    end
  else
    if @task.save
      erb :"/lists/#{@task.list_id}"
    else
      @errors=@task.errors.full_messages
      erb :"/lists/#{@task.list_id}"
    end
  end
end

get '/tasks/complete/:id' do
  @task= Task.find(params[:id])
  @task.completed= true
  @task.save
  erb :"/tasks/show"
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
    @errors = @task.errors.full_messages
    erb :'/tasks/edit'
  end
end

delete '/tasks/:id' do
  require_user
    temp = params[:task][:list_id]
    Task.find(params[:id]).destroy
    redirect "/lists/#{temp}"
end
