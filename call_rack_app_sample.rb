# 自分でRackアプリケーションを呼び出すサンプル

require_relative "./app.rb"
require "pp"

# 必須のキーは下記らしい
# （https://github.com/rack/rack/blob/master/lib/rack/lint.rb より）
# REQUEST_METHOD
# SCRIPT_NAME
# PATH_INFO
# QUERY_STRING
# SERVER_NAME
# HTTP_*
# rack.version
# rack.url_scheme
# rack.input
# rack.errors
# rack.multithread
# rack.multiprocess
# rack.run_once
# rack.hijack?
# rack.hijack

env = {
  'GATEWAY_INTERFACE' =>  'CGI/1.2',
  'HTTP_ACCEPT' =>  '*/*',
  'HTTP_HOST' =>  'localhost:9292',
  'HTTP_USER_AGENT' =>  'curl/7.49.1',
  'HTTP_VERSION' =>  'HTTP/1.1',
  'PATH_INFO' =>  '/',
  'QUERY_STRING' => '',
  'REMOTE_ADDR' =>  '::1',
  'REQUEST_METHOD' =>  'GET',
  'REQUEST_PATH' =>  '/',
  'REQUEST_URI' =>  '/',
  'SCRIPT_NAME' => '',
  'SERVER_NAME' =>  'localhost',
  'SERVER_PORT' =>  '9292',
  'SERVER_PROTOCOL' =>  'HTTP/1.1',
  'rack.version' => [1, 3],
  'rack.url_scheme' => 'http',
  'rack.input' =>  StringIO.new(""),
  'rack.errors' => nil,
  'rack.multiprocess' => false,
  'rack.multithread' => false,
  'rack.run_once' => true,
  'rack.hijack?' => false,
  'rack.hijack' => nil,
}

status, headers, body = Sinatra::Application.call(env)

puts "status = #{status}"
puts "headers = "
pp headers
puts "body = "
body.each do |line|
  puts line
end
