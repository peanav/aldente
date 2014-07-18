class User
  attr_accessor :firstName, :lastName, :email, :password

  def self.authenticate(email, password)
    'yes' if email == 'pnavasard@gmail.com'
  end
end
