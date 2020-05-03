require 'bcrypt'
class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :instructions
end

class User < ActiveRecord::Base
  include BCrypt
  has_many :recipes

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end

class Ingredient < ActiveRecord::Base
  belongs_to :recipe
end

class Instruction < ActiveRecord::Base
  belongs_to :recipe
end
