# Get a from to start a new session (i.e., the log in page)

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
<<<<<<< HEAD
  @user = User.authenticate(params[:user_name], params[:password_text])
  if @user
    session[:user_id] = @user.id
=======
  user = User.authenticate(params[:user_name], params[:password])
  if user
    session[:user_id] = user.id
>>>>>>> 6b18ce40a2bd8a6e1bac2bce6fdc91416524e057
    redirect '/'
  else
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  session[:id] = nil
  redirect '/'
end
