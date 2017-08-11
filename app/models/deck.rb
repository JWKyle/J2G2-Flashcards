class Deck < ActiveRecord::Base
  validates :name, presence: true

  has_many :cards
  has_many :rounds

  # Remember to create a migration!
end
