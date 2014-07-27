class Aldente < Sinatra::Base

  get '/' do
    redirect 'auth' unless env['warden'].authenticated?
    p env['warden'].user
    content_type :html
    send_file 'views/index.html'
  end

  get '/styles/*.css' do |sheet_name|
    content_type :css
    scss :"scss/#{sheet_name}"
  end
end
