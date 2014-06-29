class User < ActiveRecord::Base
  
  validates :username, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  
  has_many :comments
  
  def password
    self.password_digest
  end
  
  def password=(plain_text)
    if plain_text.empty?
      errors.add(:password, "can't be blank")
    elsif plain_text.length < 6
      errors.add(:password, "is too short")
    else
      self.password_digest = BCrypt::Password.create(plain_text)
    end
  end
  
  def is_password?(plain_text)
    BCrypt::Password.new(self.password_digest).is_password?(plain_text)
  end
  
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(user_params)
    user = User.find_by(username: user_params[:username])
    return user if user && user.is_password?(user_params[:password])
  end 
end
