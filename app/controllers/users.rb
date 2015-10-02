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


  

