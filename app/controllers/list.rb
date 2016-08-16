get '/lists' do
	if logged_in?
		@lists = List.all
		erb :'/lists/index'
	else
		redirect '/users/new'
	end
end

get '/lists/new' do
	if logged_in?
		erb :'/lists/new'
	else
		redirect '/users/new'
	end
end

post '/lists' do
	list = List.new(params[:list])

  if list.save
  	if request.xhr?
  		erb :'lists/_list', locals: {list: list}, layout: false
  	else
  		redirect "/lists/#{list.id}"
  	end
  else
  	@errors = list.errors.full_messages
    erb :'/lists/new'
  end

end

get '/lists/:id' do
	if logged_in?
		@list = List.find(params[:id])
		@tasks = @list.tasks
		erb :'lists/show'
	else
		redirect '/users/new'
	end
end

get '/lists/:id/edit' do
	@list = List.find(params[:id])
	erb :'lists/edit'
end

put '/lists/:id' do
	if logged_in?
		@list = List.find(params[:id])
		@list.assign_attributes(params[:list])

		if @list.save
		    redirect "/lists/#{@list.id}"
		else
		    erb :'lists/edit'
		end
	else
		redirect '/users/new'
	end
end

delete '/lists/:id' do
    List.find(params[:id]).destroy
    redirect '/lists'
end

#Handling tasks associated with a list

get '/lists/:id/tasks/new' do
	@list = List.find(params[:id])
  if logged_in?
    erb :'/tasks/new'
  else
    redirect '/users/new'
  end
end

post '/lists/:id/tasks' do
	@list = List.find(params[:id])
  task = Task.new(params[:task])

  if task.save
    if request.xhr?
      erb :'lists/_task', locals: {task: task}, layout: false
    else
      redirect "/tasks/#{task.id}"
    end
  else
    @errors = task.errors.full_messages
    erb :'/tasks/new'
  end

end

