require 'rubygems'
require 'haml'
require 'sinatra'
require 'data_mapper'
#require 'rack-flash'

$LOAD_PATH.unshift '.'

configure :development do |config|
  require "sinatra/reloader"
# config.also_reload "models/*.rb"
end

set :haml, :format => :html5 # default Haml format is :xhtml

enable :sessions
#use Rack::Flash

helpers do
  # TODO: Put helpers here.
end


DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/rjobs.db")
require 'models/offer'
DataMapper.finalize
DataMapper.auto_upgrade!

get "/" do
  @offers = Offer.all
  haml :index
end

Offer.destroy!

1.upto(10) do Offer.create(
  :title	=> "Cacona",
  :description => "Cosa re loca"
  )
end
