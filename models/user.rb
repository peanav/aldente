class User
  attr_accessor :id, :firstName, :lastName, :email, :password_hash
  include BCrypt

  def initialize(h)
    h.each {|k,v| send("#{k}=",v)}
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

  def self.get(id)
    User.new({
      id: '1',
      firstName: 'Paul',
      lastName: 'Navasard',
      email: 'pnavasard@gmail.com',
      password: '123456'
    })
  end
end
