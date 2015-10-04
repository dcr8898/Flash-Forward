get '/decks/:deck_id/cards/new' do
  @deck = Deck.find_by(id: params[:deck_id])
  @card = Card.new
  erb :'/cards/new'
end

post '/decks/:deck_id/cards' do
  deck = Deck.find(params[:deck_id])
  card = deck.cards.create(params[:card])
  redirect '/'
end
