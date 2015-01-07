get '/start' do
  if current_user
    erb :start
  else
    redirect '/'
  end
end

get '/add' do

end
