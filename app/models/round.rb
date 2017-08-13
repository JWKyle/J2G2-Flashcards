class Round < ActiveRecord::Base

  validates :user_id, :deck_id, presence: true

  belongs_to :deck
  belongs_to :user
  has_many :guesses
  has_many :cards, through: :deck

  # next_card method should live here?

  def next_card
    current_round = self.id
    p "*" * 55
    # self.deck.cards.select {|card| card.guesses.pluck(correct).include?(1)}
    result_array = self.deck.cards.select do |card|
      p "select"
      p card
      if card.guesses.where(correct: 1, round_id: current_round).exists?
        p "Not there"
         false
      else
        p "There"
        true
      end
    end
    p "^%^%^%" * 30
    p result_array

    # current_round = self.id
    # # until self.deck.cards.all.length == 0
    # array = self.deck.cards.select do |card|
    #   p "!" * 30
    #   p card.guesses
    #   card_array = card.guesses.where(correct: 1, round_id: current_round)
    #   p current_round
    #   p "@"* 40

    #   p "^"* 50
    #   # if a card has a correct answer and round, skip the card.
    #   # return cards with same round, and 0 correct
    #   if card_array.empty?
    #     return  true
    #   else
    #     false
    #   end

    #   # p card.guesses.pluck(:correct) == 0
    # end
    # return array
  end

  def first_try_correct
    self.deck.cards.select do |card|
      (card.guesses.pluck(:tries)== 1) && (card.guesses.pluck(:correct) == 1)

    end
  end

end
