get '/tasks/new' do
  erb :'tasks/new'
end

post '/tasks' do
  @list = User.find(current_user).lists.last
  @task = Task.new(params[:task])
  if @task.save
    erb :'lists/show'
  else
    @errors = @task.errors.full_messages
    erb :'tasks/new'
  end
end