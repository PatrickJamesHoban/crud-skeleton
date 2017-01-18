
# Render or redirect to form to create a new session / log in
#page render for login form
get '/sessions/new' do
  erb :'/login'
end

#login verification
post '/sessions' do
  login_info = params[:something]
  @user = User.find_by(something: login_info[:something])
  if @user.authenticate(params[:email], params[:password])
    session[:user_id] = @user[:id]
    erb :'/users_list'
  else
    @errors = @user.errors.full_messages
    erb :'/login'
  end
end

# Option 1 => delete / clear session == logout
delete '/sessions' do # use a delete route, not a get route
  session[:something] = nil # Example session[:user_id] = nil
  # session.clear # option 2:  Not sure, but .delete and .destroy may also work?
  redirect "/somewhere else"
end





