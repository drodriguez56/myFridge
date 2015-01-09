get '/' do
  erb :index
end

get '/login' do
  erb :_form_login, layout: false
end

get '/signup' do
  erb :_form_signup, layout: false
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

post '/signup' do
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

