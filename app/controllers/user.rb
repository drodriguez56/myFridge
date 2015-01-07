get '/start' do
  if current_user
    @user = current_user.foods.all.sort_by(& :expiration_date)
    erb :start
  else
    redirect '/'
  end
end

post '/new' do
  item = Food.new(params[:food])
  if item.save
    current_user.foods << item
    @user = current_user.foods.all.sort_by(& :expiration_date)
    erb :_table, :layout => false
  else
    # report problem saving data
    redirect '/start'
  end

end

get '/edit' do
  erb :_form_edit, :layout => false
end

put '/edit' do
  item = Food.find(params[:food][:id])
  item.update(params[:food])
  @user = current_user.foods.all.sort_by(& :expiration_date)
  if request.xhr?
    erb :_table, :layout => false
  else
    redirect '/start'
  end

end
