class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card
  has_one    :deck, through: :round
end
