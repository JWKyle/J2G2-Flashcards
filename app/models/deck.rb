class Deck < ActiveRecord::Base
  validates :name, presence: true

  has_many: cards
  belongs_to: round

  # Remember to create a migration!
end
