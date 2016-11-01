require 'sinatra'
require 'sinatra/reloader'

set :show_exceptions, false

def required(params, key)
  if not params.key?(key)
    raise "parameter #{key} is required"
  end
  return params[key]
end

def optional(params, key, default=nil)
  if params.key?(key)
    return params[key]
  else
    return default
  end
end

error do
  'エラーが発生しました。 - ' + env['sinatra.error'].message
end

get '/' do
  a = required(params, "a")
  b = optional(params, "b", 100)
  puts "called"
  "a = #{a} b = #{b}"
end
