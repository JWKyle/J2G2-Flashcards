
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
  p "*" * 68
  p params[:answer]
  @guess = Guess.create(params[:guess])
  p @guess
  if params[:answer] == @guess.card.answer
    @guess.correct = 1
  end
  p "*" * 68
  p @guess.correct
  @guess.save
  @round = Round.find(@guess.round_id)
  p @round
  redirect "/guesses/#{@guess.id}"
end
