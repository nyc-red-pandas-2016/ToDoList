get '/tasks' do
  @user = User.find(current_user)
  @list = @user.lists.last
  erb :'tasks/new'
end


get '/tasks/new' do
  erb :'tasks/new'
end

post '/tasks' do
  @list = User.find(current_user).lists.last
  @task = Task.new(params[:task])
  if @task.save
    redirect '/tasks'
  else
    @errors = @task.errors.full_messages
    erb :'tasks/new'
  end
end