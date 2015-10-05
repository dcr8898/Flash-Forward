post '/guesses/:guess_id' do
  if logged_in?
    guess = Guess.find_by(id: params[:guess_id])
    guess.increment!(:count)
    if guess.card.correct?(params[:answer])
      guess.update(answered: true)
      flash[:message] = "<div class='container'><h3>Correct!</h3></div>"
    else
      flash[:message] = "<div class='container'><h3>Incorrect! The correct answer was #{guess.card.answer}</h3></div>"
    end
    redirect "/rounds/#{guess.round_id}/card"
  else
    erb :not_authorized
  end
end
