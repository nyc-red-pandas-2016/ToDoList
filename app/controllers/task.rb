post '/tasks/new' do
  task = Task.new(params[:task])
  tags = params[:tags].split(' ')

  if tags.length > 0
    tags.map! do |tag|
      new_tag = Tag.find_or_create_by(name: tag.downcase)
      task.tags << new_tag
    end
  end

  list_id = params[:task][:list_id]

  if task.save
    redirect "/lists/#{list_id}"
  end
end

put '/tasks/:id' do
  task = Task.find(params[:id])
  task.update(params[:task])
  tags = params[:tags].split(' ')

  if tags.length > 0
    tags.map! do |tag|
      new_tag = Tag.find_or_create_by(name: tag.downcase)
      task.tags << new_tag
    end
  end

  list_id = params[:task][:list_id]

  if task.save
    if request.xhr?
      p "hello"
      erb :'list/_todolist_task', locals: {task: task, list: task.list}, layout: false
    else
      redirect "lists/#{list_id}"
    end
  end


end

delete '/tasks/:id' do
  task = Task.find(params[:id])
  list_id = task.list.id
  task.destroy
  redirect "lists/#{list_id}" unless request.xhr?
end
