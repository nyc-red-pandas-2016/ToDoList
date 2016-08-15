get '/lists' do
  @user = User.find(current_user)
  @lists = @user.lists
end


get '/lists/new' do
  erb :'lists/new'
end

post '/lists' do
  @list = List.new(params[:list])
  if @list.save
    erb :'lists/show'
  else
    @errors = @list.errors.full_messages
    erb :'lists/new'
  end
end