get '/lists/new' do
  redirect '/' unless logged_in?
  if request.xhr?
    erb :'/lists/new', layout: false
  else
    erb :'/lists/new'
  end
end

get '/lists/:id' do
  @list = List.find(params[:id])
  erb :'/lists/show'
end

post '/lists' do
  redirect '/' unless logged_in?
  @list = List.new(params[:list])
    if @list.save
      if request.xhr?
        erb :'lists/_add_list', layout: false
      else
        redirect "/users/#{current_user.id}"
      end
    else
      @errors = @list.errors.full_messages
      erb :'/lists/new'
    end
end
