require 'bcrypt'

class User < ActiveRecord::Base
  has_many :rounds
  has_many :played_decks, through: :rounds, source: :deck
  validates :user_name, {presence: true, uniqueness: true}

  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(password_text)
    self.password_hash = BCrypt::Password.create(password_text)
  end

  def password_correct?(password_text)
    self.password == password_text
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def self.authenticate(user_name, password_text)
    user = User.find_by_user_name(user_name)
    return user if user && user.password_correct?(password_text)
    # this returns the user object if the person enters correct log-in information
  end


  # def allow_access?
  # @user = User.authenticate(params[:user_name], params[:password_text])
  # if @user
  #   session[:user_id] = @user.id
  #   redirect '/decks'
  # else
  # end
end
