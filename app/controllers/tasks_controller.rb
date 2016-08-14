get '/list/:id/tasks/new' do
  @list = List.find(params[:id])
  # session[:list_id] = @list.id
  erb :"tasks/new"
end

put '/tasks/:id' do
  task = Task.find(params[:id])
  task.completed
  redirect "/list/#{current_list.id}"
end


post '/tasks' do
    @task = Task.new(params[:task].merge(:list_id=>session[:list_id]))
    if @task.save
       redirect "/list/#{current_list.id}"
     else
       @list = current_list
       @errors = @task.errors.full_messages
     erb :"/tasks/new"
    end
end


delete '/tasks/:id' do
     task = Task.find(params[:id])
      list_id = task.list_id
      task.destroy
    redirect "/list/#{list_id}"
end
