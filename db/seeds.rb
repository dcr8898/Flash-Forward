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

# Phil's deck:
deck = Deck.create(name: "Famous Athlete Nicknames")

new_cards = [["Broadway Joe",   "Joe Namath"],
             ["The Iron Horse", "Lou Gehrig"],
             ["The Great One",  "Wayne Gretzky"],
             ["King James",     "LeBron James"],
             ["Flo-Jo",         "Florence Griffith Joyner"],
             ["Mr. October",    "Reggie Jackson"],
             ["Pinetree",       "Colin Meads"],
             ["Air Jordan",     "Michael Jordan"],
             ["Iron Mike",      "Mike Tyson"],
             ["LT",             "Lawrence Taylor"],
             ["Super Mario",    "Mario Lemieux"]]

cards = new_cards.map { |card| Card.create(deck_id:  deck.id,
                                           question: card[0],
                                           answer:   card[1])}
# End of Phil's deck

# Rebecca's Deck
deck = Deck.create(name: "ActiveRecord Methods")

new_cards = [["Selects all items in the database where the column name equals the condition",                           "where"],
             ["Selects all item in the the database",                                                                   "all"  ],
             ["Orders the item in the datebase by the column name given, based on the passed paramater, :asc or :desc", "order"],
             ["Limites the number of records returned",                                                                 "limit"],
             ["Counts how many records exist",                                                                          "count"],
             ["Gets specific attributes by column name(s)",                                                             "pluck"],
             ["Returns the first item",                                                                                 "first"],
             ["Returns the last item",                                                                                   "last"],
             ["Finds an object by the primary key value",                                                                "find"],
             ["Finds an object by the column name given",                                                             "find_by"]]

cards = new_cards.map { |card| Card.create(deck_id:  deck.id,
                                           question: card[0],
                                           answer:   card[1])}

# End of Rebecca's deck

# David's Deck
new_cards = [["H.P. Lovecraft character also known as an Outer God",  "Nyarlathotep"],
             ["Son of Shiva and Parvati",                             "Ganeesha"],
             ["Bird-like creature in Hindu and Buddhist mythology",   "Garuda"],
             ["A million eyes and mouths",                            "Metatron"],
             ["Cat that can speak human tongue",                      "Cait Sith"],
             ["Body of a bull, head of a hog",                        "Catoblepas"],
             ["Residents of the underworld in Japanese mythology",    "Yomotsu-Shikome"],
             ["The first to eat the fruit of knowledge",              "Lilith"],
             ["Shapeshifter; known as White Bone Spirit",             "Baigujing"],
             ["Two headed dog in Greek mythology",                    "Orthrus"]]
# End of David's Deck

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
