class Round < ActiveRecord::Base
  has_many :guesses
  belongs_to :deck
  belongs_to :user
  has_many :cards, through: :deck

  def available_cards
    all_cards = self.card_ids
    spent_cards = self.guesses.map { |guess| guess.card_id if guess.answered = true }

    all_cards - spent_cards
  end

  def answered_first_try
    self.guesses.where(count: 1).count
  end

  def total_guesses
    self.guesses.sum(:count)
  end

end
