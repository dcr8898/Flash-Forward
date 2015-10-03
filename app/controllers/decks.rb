get '/decks/:deck_id' do
  @deck = Deck.find_by(id: params[:deck_id])
  @cards = @deck.cards.all
  erb :'/decks/show'
end
