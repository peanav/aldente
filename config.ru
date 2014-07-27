Bundler.require

# Pull in the Sinatra Modules
Dir[File.dirname(__FILE__) + '/modules/*.rb'].each {|file| require file }
# Pull in the Models
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

# GZIP the stuff
use Rack::Deflater
# Cookie based sessions
use Rack::Session::Cookie, :secret => "kelsey is the name of my wife"

use Warden::Manager do |config|
  config.serialize_into_session{|user| user.id }
  config.serialize_from_session{|id| User.get(id) }

  config.scope_defaults :default,
    strategies: [:password],
    action: 'unauthenticated'
  config.failure_app = Auth
end

Warden::Manager.before_failure do |env,opts|
  env['REQUEST_METHOD'] = 'POST'
end

map '/' do
  run Aldente
end

map '/auth' do
  run Auth
end
