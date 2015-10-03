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
