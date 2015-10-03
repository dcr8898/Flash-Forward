get '/guesses/:guess_id' do
  @guess = Guess.find_by(id: params[:guess_id])

  erb :'guesses/show'
end
