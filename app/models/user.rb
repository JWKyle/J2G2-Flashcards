require 'bcrypt'

class User < ActiveRecord::Base
  has_many :rounds
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

  def self.authenticate(user_name, password_text)
    user = User.find_by_user_name(user_name)
    return user if user && user.password_correct?(password_text)
  end

end
