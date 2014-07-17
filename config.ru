Bundler.require
require './app.rb'

# GZIP the stuff
use Rack::Deflater

map '/' do
  run Aldente
end
