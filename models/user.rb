require "sequel"

class User

  attr_accessor :id, :first_name, :last_name, :email, :password, :password_hash, :gravatar_email
  include BCrypt

  def initialize(h)
    h.each {|k,v| send("#{k}=",v)}
    @id ||= UUID.new.generate
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create new_password
    self.password_hash = @password
  end

  def authenticate(email, password)
    email == self.email && self.password == password
  end

  def save
    users = DB[:users]
    users.insert({
      id: self.id,
      first_name: self.first_name,
      last_name: self.last_name,
      email: self.email,
      password_hash: self.password,
      gravatar_email: self.gravatar_email
    })
  end

  def self.get(id)
    p id
    users = DB[:users]
    p users[:id => id]
    User.new users[:id => id]
  end

  def self.get_by_email(email)
    p email
    users = DB[:users]
    User.new users[:email => email] || {}
  end
end
