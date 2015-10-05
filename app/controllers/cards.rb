get '/decks/:deck_id/cards/new' do
  if logged_in?
    @deck = Deck.find_by(id: params[:deck_id])
    @card = Card.new
    erb :'/cards/new'
  else
    erb :not_authorized
  end
end

post '/decks/:deck_id/cards' do
  if logged_in?
    deck = Deck.find(params[:deck_id])
    card = deck.cards.new(params[:card])
    if card.save
      flash[:message] = "Card Created!"
      redirect "/decks/#{deck.id}/cards/new"
    else
      flash[:message] = "Couldn't create card."
      redirect "/decks/#{deck.id}/cards/new"
    end
  else
    erb :not_authorized
  end
end
