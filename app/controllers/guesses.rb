post '/guesses/:guess_id' do
  guess = Guess.find_by(id: params[:guess_id])
  guess.increment!(:count)
  if guess.card.correct?(params[:answer])
    guess.update(answered: true)
    flash[:message] = "Correct!"
  else
    flash[:message] = "Incorrect! The correct answer was '#{guess.card.answer}'"
  end

  redirect "/rounds/#{guess.round_id}/card"
end
