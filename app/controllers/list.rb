get '/lists' do
	@all_lists = List.all 
	erb :'/lists/index'
end

get '/lists/new' do
	if logged_in?
		erb :'/lists/new'
	else
		redirect '/'
	end
end

post '/lists' do
	list = List.new(params[:list])
	if list.save
    	redirect "/lists/#{list.id}"
  	else
    	@errors = list.errors.full_messages
    	erb :'/lists/new'
  	end
end

get '/lists/:id' do
	if logged_in?
		@list = List.find(params[:id])
		@all_tasks = Task.where(list_id: @list.id)
		erb :'/lists/show'
	else
		redirect '/'
	end
end