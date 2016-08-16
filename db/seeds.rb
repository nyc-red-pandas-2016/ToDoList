david = User.create({username: "dave", email: "dave@dave.com", password: "password"})
charles = User.create({username: "charles", email: "charles@charles.com", password: "password"})

a = List.create({list_name: "chores", user_id: 1})
a.tasks << Task.new({task_name: "learn ruby", status: "incomplete"})
a.tasks << Task.new({task_name: "study javascript", status: "complete"})


b = List.create({list_name: "work stuff", user_id: 2})
b.tasks << Task.new({task_name: "take out trash", status: "complete"})
b.tasks << Task.new({task_name: "do laundry", status: "incomplete"})

c = List.create({list_name: "study stuff", user_id: 2})
a.tasks << Task.new({task_name: "clean room", status: "incomplete"})
a.tasks << Task.new({task_name: "wash car", status: "complete"})
