require 'sinatra'
require 'sinatra/reloader'

get '/' do
  puts "called"
  'Hello, World !'
end
