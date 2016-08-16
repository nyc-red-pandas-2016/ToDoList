users = [
  {username: "hume", email: "backgammonluvr@gmail.com", password: "backgammon"},
  {username: "jeanjacques", email: "jj@thesocialcontract.org", password: "amourpropre"},
  {username: "socrates", email: "gadfly@theagora.edu", password: "alcibiades"},
  {username: "heidegger", email: "self@dassein.com", password: "theontic"},
  {username: "wittgenstein", email: "meaning@languagegames.org", password: "grammar"}
]

User.create!(users)

lists = [
  {name: "To Be Skeptical Of", user_id: 1},
  {name: "To Bemoan", user_id: 2},
  {name: "To Ask", user_id: 3},
  {name: "To Overthrow", user_id: 4},
  {name: "To Define", user_id: 5}
]

List.create!(lists)

List.find(1).tasks.create!([{description: "memory"}, {description: "empirical truth"}, {description: "any truth at all"}])
List.find(2).tasks.create!([{description: "lack of friends"}, {description: "l'amour propre"}, {description: "society"}])
List.find(3).tasks.create!([{description: "What is arete?"}, {description: "What is knowledge?"}, {description: "What is courage?"}, {description: "What is a sophist?"}])
List.find(4).tasks.create!([{description: "onticism"}, {description: "metaphysics"}])
List.find(5).tasks.create!([{description: "language"}, {description: "perception"}, {description: "meaning"}, {description: "game"}])

tags = [
  {name: "empiricism"},
  {name: "epistemology"},
  {name: "metaphysics"}
]
Tag.create!(tags)

Tag.find(1).tasks << [Task.find(2), Task.find(16), Task.find(15), Task.find(14), Task.find(13)]
Tag.find(2).tasks << Task.find(1, 2, 3, 8, 11)
Tag.find(3).tasks << Task.find([8, 9, 10, 11, 12])

Tag.find(1).save
Tag.find(2).save
Tag.find(3).save