get '/lists/new' do
  logged_in?

  erb :'/lists/new'
end

post '/lists' do
  @list = List.new({name: (params[:list][:name]), user_id: params[:list][:user_id]})
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
