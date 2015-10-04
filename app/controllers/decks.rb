get '/decks' do
  @decks = Deck.all
  erb :'index'
end

get '/decks/new' do
  @deck = Deck.new
  erb :'/decks/new'
end

post '/decks' do
  deck = Deck.create(params[:deck])
  redirect "/decks/#{deck.id}/cards/new"
end

get '/decks/:deck_id' do
  user = User.find_by(id: session[:user_id])
  @deck = Deck.find_by(id: params[:deck_id])
  @round = Round.find_or_create_by(user_id: user.id, deck_id: @deck.id)
  @cards = @deck.cards.all
  erb :'/decks/show'
end
