class Round < ActiveRecord::Base

  validates :user_id, :deck_id, presence: true

  belongs_to :deck
  belongs_to :user

  # next_card method should live here?

end
