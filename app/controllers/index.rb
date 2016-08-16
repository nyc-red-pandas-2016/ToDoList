get '/' do 
  @lists = List.all
  erb :index
end