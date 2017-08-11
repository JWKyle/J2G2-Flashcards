# Get form for registering a new user.
get '/users/new' do
  erb :'users/new'
end

# Send from to create a new user.
post '/users' do
end

# View specific user profile.
get '/users/:id' do
end

# Get form to edit user info.
get '/users/:id/edit' do
end

# Send form to update user info
put '/users/:id' do
end

# Delete a user from the database.
delete '/users/:id' do
end
