get '/' do
  redirect '/lists' unless !logged_in?
  erb :index
end
