get '/start' do
  if current_user
    @user = current_user.foods.order(expiration_date: :asc)
    erb :start
  else
    redirect '/'
  end
end

post '/new' do
  item = Food.new(params[:food])
  if item.save
    current_user.foods << item
    @user = current_user.foods.order(expiration_date: :asc)
      erb :_table, :layout => false
  else
    status_text = ''
    item.errors.messages.each do |key, value|
      value.each do |msg|
       status_text +=  msg
       status_text +=  " "
      end
    end
    [405, status_text]
  end

end

get '/edit' do
  erb :_form_edit, :layout => false
end

put '/edit' do
  item = Food.find(params[:food][:id])
  item.update(params[:food])
  @user = current_user.foods.order(expiration_date: :asc)
  if request.xhr?
    erb :_table, :layout => false
  else
    redirect '/start'
  end

end

delete '/-item' do
  item = Food.find(params[:food][:id])
  item.destroy
  if request.xhr?
    204
  else
    redirect "/start"
  end
end
