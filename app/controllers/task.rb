post '/tasks' do
  task = Task.new(params[:task])
  if task.save
    redirect '/lists/#{params[:task][:list_id]}'
  else
    @errors = task.errors.full_messages
    erb :'/lists/display_list'
  end
end

delete 'tasks/:id' do
  @task = Task.find(params[:id])
  @task.destroy
  redirect "/users/#{@user.id}"
end
