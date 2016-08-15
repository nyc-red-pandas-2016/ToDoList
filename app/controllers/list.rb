get '/lists/new' do
  erb :'lists/new'
end

post '/lists' do
  @list = List.new(params[:list])
  if @list.save
    # params[:id] = @list.id
    redirect "/lists/#{@list.id}"
  else
    @errors = @list.errors.full_messages
    erb :'lists/new'
  end
end

get '/lists/:id' do
  @user = User.find(current_user)
  @list = List.find(params[:id])
  erb :'lists/show'
end