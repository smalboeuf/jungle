class User < ActiveRecord::Base
  
    has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true


  def self.authenticate_with_credentials(email, password)

    email = email.strip
    email = email.downcase
    tempUser = User.find_by(email: email)
    
    
    if (tempUser && tempUser.authenticate(password))
      return tempUser
    else
      return nil
    end

  end

end
