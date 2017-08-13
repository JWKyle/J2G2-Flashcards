
# if necessary
# get '/cards' do
#   erb :'/cards/index'
# end

get '/rounds/:round_id/cards/:id' do
  @round = Round.find(params[:round_id])
  @card = Card.find(params[:id])

  erb :"cards/show"
end


# get '/decks/:deck_id/cards/:id' do
#   @deck = Deck.find(params[:deck_id])
#   @card = Card.find(params[:id])

#   erb :"cards/show"
# end
