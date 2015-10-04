# Sample code to cereate a new deck:
deck = Deck.create(name: "Simple Arithmetic")

new_cards = [["2 + 2", "4" ],
             ["3 + 2", "5" ],
             ["1 + 5", "6" ],
             ["4 + 4", "8" ],
             ["8 + 1", "9" ],
             ["7 + 5", "12"],
             ["6 + 5", "11"],
             ["5 + 2", "7" ],
             ["9 + 4", "13"],
             ["8 + 7", "15"]]

cards = new_cards.map { |card| Card.create(deck_id:  deck.id,
                                           question: card[0],
                                           answer:   card[1])}
# End of new deck sample code!

# Damian's deck:
deck = Deck.create(name: "Asanas (Sanskrit to English)")

new_cards = [["adho mukha svanasana", "downward facing dog"],
             ["balasana",             "child's pose"       ],
             ["salabhasana",          "locust"             ],
             ["tadasana",             "mountain pose"      ],
             ["trikonasana",          "triangle"           ],
             ["upavesasana",          "squatting pose"     ],
             ["vrksasana",            "tree"               ],
             ["utkatasana",           "chair pose"         ],
             ["marjaryasana",         "cat-cow"            ],
             ["ananda balasana",      "happy baby"         ],
             ["savasana",             "corpse pose"        ]]

cards = new_cards.map { |card| Card.create(deck_id:  deck.id,
                                           question: card[0],
                                           answer:   card[1])}
# End of Damian's deck

# Place your new decks above this line!
names = Array.new(50) { Faker::Name.first_name }.uniq
names.sample(10).each { |user| User.create(name: user, password: user) }

20.times do |i|
  deck = Deck.find(rand(Deck.count) + 1)
  round = Round.create(user_id: User.find(rand(User.count) + 1).id, deck_id: deck.id)
  deck.cards.each do |card|
    Guess.create(round_id: round.id, card_id: card.id, count: (rand(3) + 1), answered: true)
  end
end
