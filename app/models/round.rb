class Round < ActiveRecord::Base

  validates :user_id, :deck_id, presence: true

  belongs_to :deck
  belongs_to :user
  has_many :guesses
  has_many :cards, through: :deck

  # next_card method should live here?

  def next_card
    # until self.deck.cards.all.length == 0
    self.deck.cards.select do |card|
      p "*" * 30
      p card.guesses
      # p card.guesses.correct
        if !card.guesses
          return true
        else
          p "Peanuts!"
        end

      # p card.guesses.pluck(:correct) == 0
    end
    #
  end

  def first_try_correct
    self.deck.cards.select do |card|
      (card.guesses.pluck(:tries)== 1) && (card.guesses.pluck(:correct) == 1)

    end
  end

end
