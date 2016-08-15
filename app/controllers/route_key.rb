# get '/lists'  do
#   index
# end

# get '/lists/:id' do
#   erb :'lits/show'
# end

# get '/lists/new' do
#   erb :'lists/new'
# end

# post '/lists' do
#   if list.save
#     redirect '/list/:id'
#   else
#     errors
#     erb :'lists/new'
# end


# get '/lists/:id/edit' do
#   erb :'lists/edit'
# end

# put '/lists/:id' do
#   #put list id in the form action
#   if list.update
#     redirect '/lists/:id'
#   else
#     errors
#     erb :'lists/edit'
# end

# delete '/lists/:id' do
#   find the list
#   call destroy
#   rediect '/'
# end


# #TASK ROUTES

# get '/lists/:id/tasks' do
#   erb :'tasks/index'
# end

# get '/lists/:id/tasks/:task_id' do
#   erb :'tasks/show'
# end

# get '/lists/:id/tasks/new' do
#   erb :'tasks/new'
# end

# post '/lists/:id/tasks' do
#   if task.save
#     redirect 'lists/:id'
#   else
#     errors
#     erb :'tasks/new'
# end

