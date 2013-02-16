require 'sinatra/base'
require './helpers/xml_helper'
require 'twitter'
require 'omniauth-twitter'
require 'data_mapper'
require 'builder'
require 'smartlinks'

API_KEY    = "key"
API_SECRET = "secret"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/sqlite.db")

Twitter.configure do |config|
  config.consumer_key    = API_KEY
  config.consumer_secret = API_SECRET
end

use Rack::Session::Cookie, secret: "_session_secret_"
use OmniAuth::Strategies::Developer
use OmniAuth::Builder do
  provider :twitter, API_KEY, API_SECRET
end

require './main'

run TwiToRSS
