get '/decks' do
  @decks = Deck.all
  erb :'index'
end

get '/decks/new' do
  @deck = Deck.new
  erb :'/decks/new'
end

post '/decks' do
  deck = Deck.new(params[:deck])
  if deck.save
    flash[:message] = "Deck Created!"
    redirect "/decks/#{deck.id}/cards/new"
  else
    flash[:message] = "Couldn't create deck."
    redirect "/decks/new"
  end
end

get '/decks/:deck_id' do
  @deck = Deck.find_by(id: params[:deck_id])
  @cards = @deck.cards.all
  erb :'/decks/show'
end
