class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
end

class User < ActiveRecord::Base
  has_many :recipes
end

class Ingredient < ActiveRecord::Base
  belongs_to :recipe
end
