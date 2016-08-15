User.create(:username=>"guest",:full_name=>"Guest User",:password=>"password")
lists = [{name:"Packing List",user_id:1},{name:"House Cleaning",user_id:1},{name:"Vacation Checklist",user_id:1}]
tasks = [
  {description:"E-ticket",list_id:1},
  {description:"Traveler's Check",list_id:1},
  {description:"Guide Book",list_id:1},
  {description:"Passpost",list_id:2,complete:true},
  {description:"Vacuum",list_id:2},
  {description:"Furniture freshening",list_id:2,complete:true},
  {description:"Make Bed",list_id:2},
  {description:"towel",list_id:3,complete:true},
  {description:"sunglasses",list_id:3},
  {description:"sun hat",list_id:3},
  {description:"wetsuit",list_id:3,complete:true}
]
lists.each do |list|
 List.create(list)
end
tasks.each do |list|
 Task.create(list)
end
