get '/lists' do
	@lists = List.all 
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
	if request.xhr?
		list.save
	elsif list.save && !(request.xhr?)
    	redirect "/lists/#{list.id}"
  	else
    	@errors = list.errors.full_messages
    	erb :'/lists/new'
  	end
end

get '/lists/:id' do
	if logged_in?
		@list = List.find(params[:id])
		@tasks = @list.tasks
		erb :'/lists/show'
	else
		redirect '/'
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
		redirect '/'
	end
end

delete '/lists/:id' do
    List.find(params[:id]).destroy
    redirect '/lists'
end

