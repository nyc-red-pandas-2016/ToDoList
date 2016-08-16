get '/tasks/new' do
  erb :'/lists/new'
end

post '/lists/:id/tasks' do
  @list = List.new(params[:list])
  if @list.save
    redirect "/users/#{current_user.id}"
  else
    @errors = @list.errors.full_messages
    erb :'/lists/new'
  end
end
