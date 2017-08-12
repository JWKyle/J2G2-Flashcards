get '/rounds' do
  @rounds = Round.all
  # erb :'/rounds/index' No File Yet
end

get '/rounds/new' do
  p params
   # should persist deck_id from previous page

end

# link to here is from decks/index page.
post '/rounds' do
  p params
  p params[:round]
  p "*"* 50
  p params[:round]
  @round = Round.create(params[:round])
  p @round
  redirect "/rounds/#{@round.id}"

end

get '/rounds/:id' do
  @round = Round.find_by(:id)
  @card= @round.next_card


  # until all cards true
  # loop through rounds/:id/cards/:id
  # end
  # erb :"/rounds/profile"


end
