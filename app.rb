require "sinatra"
require "sinatra/reloader"
require "json"
#require "sqlite3"

set :show_exceptions, false

# クエリーパラメータから必須項目を取り出す
def get_required(params, key)
  key = key.to_s
  if not params.key?(key)
    raise "parameter #{key} is missing"
  end
  return params[key]
end

# クエリーパラメータから任意項目を取り出す
def get_optional(params, key, default=nil)
  key = key.to_s
  if params.key?(key)
    return params[key]
  else
    return default
  end
end

# before
before do
  response.headers["Content-Type"] = "application/json; charset=utf-8"
  response.headers["Access-Control-Allow-Origin"] = "*"
end

# after
after do
end

error do
  'エラーが発生しました。 - ' + env['sinatra.error'].message
end

get '/' do
  a = get_required(params, "a")
  b = get_optional(params, "b", 100).to_i
  puts "called"
  ret = {
    params: {}
  }
  ret[:params][:a] = a
  ret[:params][:b] = b
  return JSON.generate(ret)
end
