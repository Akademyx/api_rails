class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipesteps
  validates :title, presence: true, length: {minimum: 3}



def self.index
  self.all
end

def self.display(u_id)
  self.joins(:user).where("user_id = ?", u_id)
end

def self.show(u_id, r_id)
  self.joins(:user).select("recipes.title", "recipes.description", "users.name").where("users.id = ? and recipes.id = ?", u_id, r_id)
end
end
