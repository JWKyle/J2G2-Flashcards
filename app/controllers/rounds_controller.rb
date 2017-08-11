get '/rounds' do
  @rounds = Round.all
  # erb :'/rounds/index' No File Yet
end
