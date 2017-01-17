# app/models/user.rb mock-up with basic BCrypt functions.

require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  # has_many :somethings 
  # belongs_to :something

  # validates :not_custom_something
  # validate :custom_something


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    if self.exists?(:email => email)
      user = self.find_by(:email => email)
      user.password == password
    else
      nil
    end
  end

end