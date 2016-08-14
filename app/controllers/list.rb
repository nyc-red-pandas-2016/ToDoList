get '/lists/new' do
  logged_in?

  erb :'/lists/new'
end

post '/lists' do
  @list = List.new({title: (params[:list][:title]), user_id: params[:list][:user_id]})
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
  @task = Task.find(params[:id])
  erb :'/lists/display_list'
end

delete '/lists/:id' do
  @list = List.find(params[:id])
  @list.destroy
  redirect '/listss/show'
end
