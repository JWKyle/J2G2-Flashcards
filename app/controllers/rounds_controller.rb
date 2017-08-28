get '/rounds' do
  @rounds = Round.all
  # erb :'/rounds/index' No File Yet
end

get '/rounds/new' do

   # should persist deck_id from previous page

end

# link to here is from decks/index page.
post '/rounds' do

  @round = Round.create(params[:round])
  redirect "/rounds/#{@round.id}"

end

get '/rounds/:id' do
  @round = Round.find(params[:id])
  @cards = @round.next_card
  @card = @cards.first

  if @card
    redirect "/rounds/#{@round.id}/cards/#{@card.id}"
  else

    erb :"/rounds/show"
  end
end
