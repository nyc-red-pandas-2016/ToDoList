get '/' do
  @list = List.all
  erb :index
end

