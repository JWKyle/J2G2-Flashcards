
# below won't be included in final but usesful for testing?
get '/guesses' do
  @guesses = Guess.all
  erb :"/guesses/index"
end

get '/guesses/:id' do
  @guess = Guess.find(params[:id])
  erb :'guesses/show'

end

post '/guesses' do

  @guess = Guess.create(params[:guess])
  if params[:answer] == @guess.card.answer
    @guess.correct = 1
  end

  @guess.save
  @round = Round.find(@guess.round_id)

  redirect "/guesses/#{@guess.id}"
end
