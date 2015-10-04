get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'users/new'
  end
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  user_params = params[:user]
  user = User.find_by(name: user_params[:name])
  if user && user.password == user_params[:password]
    session[:user_id] = user.id
    flash[:message] = "Successfully logged in."
    redirect "/users/#{user.id}"
  else
    flash[:message] = "Cannot log in."
    redirect '/users/login'
  end
end

get '/users/logout' do
  session.clear
  redirect '/'
end

get '/users/:id' do
  if logged_in?
    @user = User.find_by(id: params[:id])
    erb :'users/show'
  else
    erb :not_authorized
  end
end
