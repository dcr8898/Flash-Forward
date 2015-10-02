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
  if user = User.find_by(name: params[:user][:name])
    if params[:user][:password_hash] == user.password_hash
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      @errors = ["Password doesn't match username!"]
      erb :'users/login'
    end
  else
    @errors = ["Username doesn't exist!"]
    erb :'users/login'
  end
end


  

