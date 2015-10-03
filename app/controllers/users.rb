get '/users/new' do
  erb :'users/new'
end

get '/users/login' do
  erb :'users/login'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect "/users/#{@user.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'users/new'
  end
end

post '/users/login' do
  user_params = params[:user]
  user = User.find_by(username: user_params[:name])
  if user && user.password == user_params[:password]
   session[:user_id] = user.id
   flash[:login] = "Successfully logged in!"
   redirect '/'
  else
   flash[:error] = "Mismatched username/password."
   redirect '/users/login'
  end
end

get '/users/logout' do
  session.clear
  redirect '/'
end

get '/users/:id' do

  erb :'users/show'
end
