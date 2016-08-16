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

put '/lists/:id' do
  @list = List.find(params[:id]) 
  @list.assign_attributes(params[:list]) 

  if @list.save 
    redirect '/lists' 
  else
    erb :'lists/edit' 
  end

end


