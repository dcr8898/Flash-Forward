class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  def correct?(guess)
    guess == self.answer
  end

end
