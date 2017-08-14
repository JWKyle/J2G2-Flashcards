
get '/decks' do
  if logged_in?
    @user = current_user
  else
    @user = User.new(user_name: "anonymous", password: "anonymous")
  end
  @decks = Deck.all
  erb :'/decks/index'
end
