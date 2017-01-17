

post '/sessions' do
  login_info = params[:something]
  @user = User.find_by(something: login_info[:something])
  if @user.authenticate

end

delete '/sessions' do # use a delete route, not a get route
  session[:something] = nil # Example session[:user_id] = nil
  redirect "/somewhere else"
end

