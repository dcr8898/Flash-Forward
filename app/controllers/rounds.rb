get '/rounds/:round_id' do
  round = Round.find_by(id: params[:round_id])
  all_cards = round.card_ids
  spent_cards = round.guesses.map { |guess| guess.card_id if guess.answered = true }
  available_cards = (all_cards - spent_cards)
  if available_cards.empty?
    "game summary"
  else
    next_card_id = available_cards.sample
    next_guess = Guess.find_or_create_by(round_id: round.id, card_id: next_card_id)
    redirect "/guesses/#{next_guess.id}"
  end
end
