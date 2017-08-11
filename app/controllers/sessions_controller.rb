# Get a from to start a new session (i.e., the log in page)

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.authenticate(params[:user_name], params[:password])
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    erb :'/sessions/new'
  end
end