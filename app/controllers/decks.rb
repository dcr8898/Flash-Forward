get '/decks/:deck_id' do
  @deck = Deck.find_by(id: params[:deck_id])
  erb :'/decks/show'
end
