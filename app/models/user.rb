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

end
