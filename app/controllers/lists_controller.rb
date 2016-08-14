get '/lists' do
  @lists = current_user.lists
  erb :"index"
end

get '/list/:id' do
    @list = List.find(params[:id])
    session[:list_id] = @list.id
    redirect '/' unless @list.user == current_user
    erb :'lists/show'
end

get '/lists/new' do
  erb :"lists/new"
end

get '/lists/edit' do
  erb :"lists/edit"
end

put '/list/:id' do
  list = List.find(params[:id])
  list.update_attributes(:title=>params[:list])
  redirect :'/'
end

post '/lists' do
  @list = List.new(params[:list].merge(:user=>current_user))
  if @list.save
    redirect "/lists"
  else
    @errors = @list.errors.full_messages
    erb :'lists/new'
  end
end

delete '/lists/:id' do
  List.find(params[:id]).destroy
  redirect "/"
end
