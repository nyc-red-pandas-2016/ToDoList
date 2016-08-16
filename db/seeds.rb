User.destroy_all
List.destroy_all
Task.destroy_all

user = User.create!(username: "momo", email: "momo@gmail.com", password: "123456")

list = user.lists.create!(title: "Home chores")

tasks = list.tasks.create!([{name: "Wash dishes", description: "wash all the dirty dishes from dinner"}, {name: "Fold clothes", description: "fold towels and put in bathroom, hang dresses in closet"}, {name: "Prepare meals", description: "Cook rice and oats for the week"}])

