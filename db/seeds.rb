User.destroy_all

users = [
  {first_name: 'Joel', last_name: 'Brewer', email: 'joel@brewerdigital.com'}
]

users.each do |u|
  User.create(u)
end

recipes = [
  {name: 'Chicken Parm', user_id: User.first.id}
]

recipes.each do |r|
  Recipe.create(r)
end
