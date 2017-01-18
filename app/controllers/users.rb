
# Retrieve the form to create a new user,
get '/users/new' do
  erb :'/users/new'
end


# Create a new user, 
post '/users' do
  user = User.new(params[:user])
  if user.save
    redirect "/users/#{user.id}"
  else
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end
