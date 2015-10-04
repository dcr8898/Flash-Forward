class User < ActiveRecord::Base
  has_many :rounds
  has_many :decks, through: :rounds

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  # returns round history by deck
  def round_history
    rounds = self.rounds.order(created_at: :desc)
    memo = Hash.new { |h, k| h[k] = [] }
    history = rounds.each_with_object(memo) { |round, memo|
                                              memo[round.deck.name] << round
                                            }
    Hash[history.sort]
  end

end
