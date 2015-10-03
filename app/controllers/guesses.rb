get '/guesses/:guess_id' do
  @guess = Guess.find_by(id: params[:guess_id])
  @guess.increment!(:count)

  erb :'guesses/show'
end
