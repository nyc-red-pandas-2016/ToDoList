User.destroy_all 
List.destroy_all
Task.destroy_all

user = User.create!(username: "momo", email: "momo@gmail.com", password: "123456")

list = List.create!(title: "Home chores", user_id: 1)

tasks = [{name: "Wash dishes", description: "wash all the dirty dishes from dinner", list_id: 1, user_id: 1}, {name: "Fold clothes", description: "fold towels and put in bathroom, hang dresses in closet", list_id: 1, user_id: 1}, {name: "Prepare meals", description: "Cook rice and oats for the week", list_id: 1, user_id: 1}]

Task.create!(tasks)