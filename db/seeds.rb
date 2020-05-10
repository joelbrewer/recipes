User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all

users = ['joel@brewerdigital.com', 'tanyabrewer01@gmail.com']

users.each do |u|
  new_user = User.create(email: u)
  new_user.password = ENV["DEFAULT_PASSWORD"]
  new_user.is_admin = true
  new_user.save
end

recipes = [
  {
    name: 'Chicken Parm',
    user_id: User.first.id,
    serving_number: 5,
    total_time: '3 days',
  }
]

recipes.each do |r|
  Recipe.create(r)
end

r = Recipe.first
rid = r.id

ingredients = [
  { name: '10 pounds of chicken', recipe_id: rid },
  { name: '4 pounds of flour', recipe_id: rid },
  { name: '1 cow of milk', recipe_id: rid }
]

ingredients.each do |i|
  Ingredient.create(i)
end

r.instructions = 'Mix chicken, flour, and milk. Bake for two days.'
r.save
