enable :sessions

get '/' do
  erb :index
end

post '/'  do
  @user = User.find_by_email(params[:email])
  if @user.login(params[:password]).nil?
    erb :index
  else
    session[:user_id] = @user.id
    redirect '/secret_page'
  end
end


# before '/secret_page' do
#   redirect '/' if session[:user_id].nil?
# end

# get '/secret_page' do
#    @user = User.find(session[:user_id])
#    erb :secret_page
# end


get '/secret_page' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :secret_page
  else
    redirect '/'
  end
end

get '/logout' do 
  session[:user_id] = nil
  redirect '/'
end


get '/create_account' do
  erb :create_account
end

post '/successfully_create_ac' do
  @user = User.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    hashed_password: BCrypt::Password.create(params[:password])
    )
  erb :successfully_create_ac
end

