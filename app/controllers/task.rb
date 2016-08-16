post '/tasks/new' do
  task = Task.new(params[:task])
  list_id = params[:task][:list_id]

  if task.save
    redirect "/lists/#{list_id}"
  else
    @errors = task.errors.full_messages
    erb :'/lists/display_list'
  end
end

put '/tasks/:id' do
  task = Task.find(params[:id])
  task.update(params[:task])
  list_id = params[:task][:list_id]
  redirect "/lists/#{list_id}"
end

delete '/tasks/:id' do
  task = Task.find(params[:id])
  list_id = task.list.id
  task.destroy
  redirect "/lists/#{list_id}"
end
