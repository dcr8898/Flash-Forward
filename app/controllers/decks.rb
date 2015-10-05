get '/decks' do
  @decks = Deck.all
  erb :'index'
end

get '/decks/new' do
  if logged_in?
    @deck = Deck.new
    erb :'/decks/new'
  else
    erb :not_authorized
  end
end

post '/decks' do
  if logged_in?
    deck = Deck.new(params[:deck])
    if deck.save
      flash[:message] = "Deck Created!"
      redirect "/decks/#{deck.id}/cards/new"
    else
      flash[:message] = "Couldn't create deck."
      redirect "/decks/new"
    end
  else
    erb :not_authorized
  end
end

get '/decks/:deck_id' do
  if logged_in?
    @deck = Deck.find_by(id: params[:deck_id])
    @cards = @deck.cards.all
    erb :'/decks/show'
  else
    erb :not_authorized
  end
end
