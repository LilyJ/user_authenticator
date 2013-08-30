require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end


  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def login(password)
    # @user = User.find_by_email(username)
    if self.password == password
      return self.id
    else
      nil
    end
  end

end
