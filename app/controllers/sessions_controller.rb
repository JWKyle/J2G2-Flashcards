# Get a from to start a new session (i.e., the log in page)

get '/sessions/new' do
  session[:user_id] = nil
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:user_name], params[:password_text])
  if @user
    session[:user_id] = @user.id
    redirect '/decks'
  else
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  session[:user_id] = nil
  redirect '/'
end
