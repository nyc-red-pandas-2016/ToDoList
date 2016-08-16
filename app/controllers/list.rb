get '/lists/new' do

  erb :'/lists/new'
end

post '/lists' do
  @list = List.new(params[:list])
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
  @tasks = @list.tasks
  erb :'/lists/display_list'
end

delete '/lists/:id' do
  @list = List.find(params[:id])
  @list.destroy
  redirect '/lists/show'
end
