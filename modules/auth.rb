class Auth < Sinatra::Base

  get '/' do
    #User.authenticate 'pnavasard@gmail.com', 'here';
    session[:name]
  end

  post '/' do
    'auth user here'
  end

end
