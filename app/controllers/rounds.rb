get '/rounds/:round_id' do
  @round = Round.find_by(id: params[:round_id])
  available_cards = @round.available_cards
  if available_cards.empty?
    erb :'rounds/show'
  else
    next_card_id = available_cards.sample
    next_guess = Guess.find_or_create_by(round_id: @round.id, card_id: next_card_id)
    redirect "/guesses/#{next_guess.id}"
  end
end
