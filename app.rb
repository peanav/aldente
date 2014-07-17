class Aldente < Sinatra::Base

  get '/' do
    send_file 'index.html'
  end

end
