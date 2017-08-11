
# if necessary
# get '/cards' do
#   erb :'/cards/index'
# end
get '/decks/:deck_id/cards/:id' do
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:id])

  erb :"cards/show"
end
