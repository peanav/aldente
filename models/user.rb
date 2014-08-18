require "sequel"
require 'digest/md5'

class User

  attr_accessor :id, :first_name, :last_name, :email, :password, :password_hash, :gravatar_image_url
  include BCrypt

  def initialize(h)
    h.each {|k,v| send("#{k}=",v)}
    self.gravatar_image_url
    @id ||= UUID.new.generate
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create new_password
    self.password_hash = @password
  end

  def email=(email)
    return unless email
    hash = Digest::MD5.hexdigest(email.downcase)
    @gravatar_image_url = "http://www.gravatar.com/avatar/#{hash}"
    @email = email
  end

  def authenticate(email, password)
    email == self.email && self.password == password
  end

  def save
    users = DB[:users]
    users.insert({
      first_name: self.first_name,
      last_name: self.last_name,
      email: self.email,
      password_hash: self.password
    })
  end

  def self.get(id)
    users = DB[:users]
    User.new users[:id => id]
  end

  def self.get_by_email(email)
    users = DB[:users]
    User.new users[:email => email] || {}
  end
end
