get '/' do
  erb :index
end

post '/login' do
  user = User.find_by(username: params[:user][:username])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/start'
  else
    redirect '/'
  end
end

post '/singup' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/start'
  else
    redirect '/'
  end
end

get '/logout' do
 session[:user_id] =  nil
 redirect '/'
end

