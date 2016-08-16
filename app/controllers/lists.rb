get '/lists/new' do
  erb :'/lists/new'
end

get '/lists/:id' do
  @list = List.find(params[:id])
  erb :'/lists/show'
end

post '/lists' do
  @list = List.new(params[:list])
  if @list.save
    redirect "/users/#{current_user.id}"
  else
    @errors = @list.errors.full_messages
    erb :'/lists/new'
  end
end
