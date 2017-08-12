
# below won't be included in final but usesful for testing? 
get '/guesses' do
  @guesses = Guess.all
  erb :"/guesses/index"
end
