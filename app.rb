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
  response.headers["Cache-Control"] = "max-age=10, public, must-revalidate"
  headers = request.env.select {|key, val| key.start_with?("HTTP_") }
  ret = {
    hello: "sinatra",
    headers: headers,
  }
  return JSON.generate(ret)
end

get '/hoge' do
  a = get_required(params, "a")
  b = get_optional(params, "b", 100).to_i
  ret = {
    a: a,
    b: b,
  }
  return JSON.pretty_generate(ret)
end
