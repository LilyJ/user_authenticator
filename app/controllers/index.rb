enable :sessions

get '/' do
  # let user log in here
  # have create_account link
  erb :index
end
# if the password matched username
post '/secret_page' do
 # has log out button that link back to index.erb
end

# if password didn't match
# throw an error and direct to index.erb

get '/create_account' do
erb :create_account
end

post '/successfully_create_ac' do
  # has link that direct user to the secret page
  @user = User.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    hashed_password: BCrypt::Password.create(params[:password])
    )

  erb :successfully_create_ac
end


# to do able to log in with authentication
