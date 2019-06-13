class Recipestep < ApplicationRecord
  belongs_to :recipe
  validates :title, presence: true, length: {in: 4..20}
  validates :description, presence: true, length: {minimum: 4}
  validates :order, presence: true

def self.index
  self.all
end

def self.query(id)
  self.find(id)
end

end
