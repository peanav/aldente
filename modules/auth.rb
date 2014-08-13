class Auth < Sinatra::Base

  get '/' do
    p 'login'
    content_type :html
    send_file 'views/auth.html'
  end

  post '/' do
    env['warden'].authenticate! :password
    p 'redirecting'
    redirect '/'
  end

  post '/unauthenticated' do
    p 'un auth man'
    redirect '/auth'
  end

  Warden::Strategies.add(:password) do
    def authenticate!
      p params
      user = User.get_by_email params['email']
      if user.authenticate(params['email'], params['password'])
        p 'yes'
        success!(user)
      else
        fail!("Could not log in")
      end
    end
  end

end
