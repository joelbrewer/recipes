User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
Instruction.destroy_all

users = [
  {first_name: 'Joel', last_name: 'Brewer', email: 'joel@brewerdigital.com'}
]

users.each do |u|
  new_user = User.create(u)
  new_user.password = ENV["DEFAULT_PASSWORD"]
  new_user.save
end

recipes = [
  {name: 'Chicken Parm', user_id: User.first.id}
]

recipes.each do |r|
  Recipe.create(r)
end

rid = Recipe.first.id

ingredients = [
  { name: "chicken", quantity: "1", unit: "pound", recipe_id: rid },
  { name: "flour", quantity: "1", unit: "cup", recipe_id: rid },
  { name: "milk", quantity: ".5", unit: "cup", recipe_id: rid }
]

instructions = [
  { text: "Make sauce", order: 1, recipe_id: Recipe.first.id },
  { text: "Prepare chicken", order: 2, recipe_id: Recipe.first.id },
  { text: "Bake chicken", order: 3, recipe_id: Recipe.first.id }
]

ingredients.each do |i|
  Ingredient.create(i)
end

instructions.each do |i|
  Instruction.create(i)
end
