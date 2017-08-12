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
  @round = Round.create(deck_id: params[:deck_id], user_id: session[:id])
  redirect '/rounds/#{@round.id}'

end

get '/rounds/:id' do
  # until all cards true
  # loop through rounds/:id/cards/:id
  # end
  # erb :"/rounds/profile"


end
