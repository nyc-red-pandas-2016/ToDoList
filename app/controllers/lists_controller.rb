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
  return erb :'/lists/_new_form',layout: false  if request.xhr?
  erb :"lists/new"
end

get '/lists/:id/edit' do
  @list = List.find(params[:id])
  return erb :"lists/_edit_form",layout:false if request.xhr?
  erb :"lists/edit"
end

put '/list/:id' do
  list = List.find(params[:id])
  list.update_attributes(:name=>params[:name])
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
