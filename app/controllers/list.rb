get '/lists/create' do
  erb :'/lists/create'
end

post '/lists/create' do
  list= List.new(params[:list])

  if list.save
    redirect '/'
  else
    @errors = list.errors.full_messages
    erb :'/lists/create'
  end
end

get '/lists/:id' do
  @list= List.find(params[:id])
  @tasks= Task.where(list_id: @list.id)
  erb :'/lists/show'
end

