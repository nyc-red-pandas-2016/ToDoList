get '/lists' do
  @lists = current_user.lists
  erb :"index"
end

get '/list/:id' do
    @list = List.find(params[:id])
    redirect '/' unless @list.user == current_user
    erb :'lists/show'
end

get '/lists/new' do
  erb :"lists/new"
end

post '/lists' do
  @list = List.new(params[:list].merge(:user=>current_user))
  if @list.save
    redirect "/lists"
  else
    @errors = @list.error.full_messages
    erb :'lists/new'
  end
end
