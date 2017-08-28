
get '/decks' do
  if logged_in?
    @user = current_user
  else
    @user = User.create(user_name: "anonymous5", password: "anonymous")
  end
  @decks = Deck.all
  erb :'/decks/index'
end
