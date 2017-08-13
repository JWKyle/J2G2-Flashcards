
get '/decks' do
  @user = current_user
  @decks = Deck.all
  erb :'/decks/index'
end


