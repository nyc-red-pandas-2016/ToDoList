get '/lists/:id' do
  @list = List.find(params[:id])
  @tasks = @list.tasks
  erb:'list/show'
end

post '/lists/new' do
  @list = List.new(params[:list])
  if @list.save
    if request.xhr?
      erb :'list/_todolist_list_item', locals: {list: @list}, layout: false
    else
      @errors = @list.errors.full_messages
      redirect "/"
    end
  end
end

get '/lists/:id/edit' do
  list = List.find(params[:id])
  list.update(name: params[:list][:name])
  if list.save
    redirect "/users/#{current_user}"
  end
end