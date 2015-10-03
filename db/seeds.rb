deck = Deck.create(name: "Simple Arithmetic")

sample_cards = [["2 + 2", "4" ],
                ["3 + 2", "5" ],
                ["1 + 5", "6" ],
                ["4 + 4", "8" ],
                ["8 + 1", "9" ],
                ["7 + 5", "12"],
                ["6 + 5", "11"],
                ["5 + 2", "7" ],
                ["9 + 4", "13"],
                ["8 + 7", "15"]]

cards = sample_cards.map { |card| Card.create(deck_id:  deck.id,
                                       question: card[0],
                                       answer:   card[1])}

names = Array.new(50) { Faker::Name.first_name }.uniq
names.sample(10).each { |user| User.create(name: user, password: user) }

20.times do |i|
  round = Round.create(user_id: User.all.sample.id, deck_id: deck.id)
  cards.each do |card|
    Guess.create(round_id: round.id, card_id: card.id, count: (rand(3) + 1), answered: true)
  end
end
