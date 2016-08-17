#Create a new list
get '/lists/new' do
  if request.xhr?
    erb :'lists/_new_list_form', layout: false
  else
    erb :'lists/new'
  end
end

post '/lists' do
  @list = List.new(params[:list])
  if @list.save
    if request.xhr?
      erb :'lists/_new_list_item', layout: false, locals: {list: @list}
    else
      redirect "/users/#{current_user.id}"
    end
  else
    @errors = @list.errors.full_messages
    erb :'lists/new'
  end
end

#Read a List w/ tasks - See '/lists/:id/tasks route.rb'
# get '/lists/:id' do
#   @list = List.find(params[:id])
#   erb :'lists/show' #should be 'lists/index'
# end

#Edit a list
get '/lists/:id/edit' do
  @list = List.find(params[:id])
  erb :'lists/edit'
end

put '/lists/:id' do
  @list = List.find(params[:id])
  @list.update(title: params[:list][:title])
  redirect "/users/#{current_user.id}"
end

#Delete a list
delete '/lists/:id' do
  List.find(params[:id]).destroy
  if request.xhr?
    "true"
  else
    redirect "/users/#{current_user.id}"
  end
end
