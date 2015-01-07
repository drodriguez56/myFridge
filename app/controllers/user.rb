get '/start' do
  if current_user
    erb :start
  else
    redirect '/'
  end
end

post '/new' do
  item = Food.new(params[:food])
  if item.save
    current_user.foods << item
    redirect '/start'
  else
    # report problem saving data
    redirect '/start'
  end

end
