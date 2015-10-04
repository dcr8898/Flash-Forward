get '/decks/:deck_id/cards/new' do
  @deck = Deck.find_by(id: params[:deck_id])
  @card = Card.new
  erb :'/cards/new'
end

post '/decks/:deck_id/cards' do
  deck = Deck.find(params[:deck_id])
  card = deck.cards.new(params[:card])
  if card.save
    flash[:message] = "Card Created!"
    redirect "/decks/#{deck.id}/cards/new"
  else
    flash[:message] = "Couldn't create card."
    redirect "/decks/#{deck.id}/cards/new"
  end
end
