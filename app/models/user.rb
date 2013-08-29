class User < ActiveRecord::Base

  include BCrypt

  def authenticate(email, password)
    @user = User.find_by_email(email)
    @user.hashed_password == password ? @user : nil
  end


  def password
    @password ||= Password.new(hashed_password)
  end


  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

end
