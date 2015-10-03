get '/guesses/:guess_id' do
  @guess = Guess.find_by(id: params[:guess_id])

  erb :'guesses/show'
end

post '/guesses/:guess_id' do
  guess = Guess.find_by(id: params[:guess_id])
  guess.increment(:count)
  if guess.card.correct?(params[:answer])
    guess.answered = true
    flash[:message] = "Correct!"
  else
    flash[:message] = "Wrong! Sorry :("
  end

  redirect "/rounds/#{guess.round_id}"
end


