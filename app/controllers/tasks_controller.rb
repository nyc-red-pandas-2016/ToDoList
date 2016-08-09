get '/list/:id/tasks/new' do
  @list = List.find(params[:id])
  session[:list_id]=@list.id
  erb :"tasks/new"
end
# 
# get '/task/:id' do
#   # session[:list_id].clear
#
#   erb :"tasks/show"
# end


post '/tasks' do
    @task = Task.new(params[:task].merge(:list_id=>session[:list_id]))
    if @task.save
       redirect "/list/#{current_list.id}"
     else
       @errors = @task.errors.full_messages
       erb :"/list/#{current_list.id}/tasks/new"
    end
end
