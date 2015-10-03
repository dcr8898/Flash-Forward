get '/' do
  if !current_user
    redirect '/decks'
  else
    erb :'index'
  end
end
