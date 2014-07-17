class Aldente < Sinatra::Base

  get '/' do
    content_type :html
    send_file 'index.html'
  end

  get '/styles/*.css' do |sheet_name|
    content_type :css
    scss :"scss/#{sheet_name}"
  end

end
