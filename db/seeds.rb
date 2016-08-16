User.destroy_all
List.destroy_all
Task.destroy_all

User.create(username: "Nico", email: "Nico", password: "password")

5.times do
  List.create(name: Faker::Name.first_name , user_id: 1)
end

List.all.each do |list|
  8.times do
    Task.create(task_name: Faker::Name.title, list_id: list.id)
  end
end
