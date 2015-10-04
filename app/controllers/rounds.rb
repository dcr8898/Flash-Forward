get '/rounds/:round_id/card' do
  @round = Round.find_by(id: params[:round_id])
  available_cards = @round.available_cards
  if available_cards.empty?
    erb :'rounds/show'
  else
    next_card_id = available_cards.sample
    @guess = Guess.find_or_create_by(round_id: @round.id, card_id: next_card_id)
    erb :'cards/show'
  end
end

post '/rounds' do
  deck = Deck.find_by(id: params[:deck_id])
  if deck.nil?
    flash[:message] = "Deck could not be located"
    redirect request.referer
  end
  round = Round.create(user_id: current_user.id, deck_id: deck.id)
  redirect "/rounds/#{round.id}/card"
end
