class User
  attr_accessor :id, :firstName, :lastName, :email, :password

  def initialize(h)
    h.each {|k,v| send("#{k}=",v)}
  end

  def authenticate(email, password)
    true if email == self.email && password == self.password
  end

  def self.get(id)
    User.new({
      id: "1",
      firstName: 'Paul',
      lastName: 'Navasard',
      email: 'pnavasard@gmail.com',
      password: '123456'
    })
  end
end
