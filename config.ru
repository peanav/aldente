Bundler.require

# Pull in the Sinatra Modules
Dir[File.dirname(__FILE__) + '/modules/*.rb'].each {|file| require file }
# Pull in the Models
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

# GZIP the stuff
use Rack::Deflater
# Cookie based sessions
use Rack::Session::Cookie, secret: 'Hello'

map '/' do
  run Aldente
end

map '/auth' do
  run Auth
end
