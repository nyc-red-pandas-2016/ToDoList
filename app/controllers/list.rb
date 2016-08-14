get '/lists/new' do
  @list_id = List.last.id

  erb :'/lists/new'
end

post '/lists' do
  @list = List.new({name: (params[:list][:name]), user_id: params[:list][:user_id]})
  @list_id = List.last.id
  @task = Task.new({description: (params[:task][:description]), user_id: (params[:task][:user_id]), list_id: (params[:task][:list_id])})
  @list_id = List.last.id
  if @list.save
    redirect '/lists/show'
  else
    @errors = @list.errors.full_messages
    erb :'/lists/new'
  end
end

get '/lists/show' do
  @lists = List.all
  erb :'/lists/show'
end

get '/lists/:id' do
  @list = List.find(params[:id])
  @tasks = List.find(params[:id]).tasks
  erb :'/lists/display_list'
end

delete '/lists/:id' do
  @list = List.find(params[:id])
  @list.destroy
  redirect '/lists/show'
end
