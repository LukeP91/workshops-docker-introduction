require 'bundler' ; Bundler.require

set :show_exceptions, true
set :bind, '0.0.0.0'
set :server, %w[thin]

get '/' do
  ENV.fetch("HELLO", "hello world")
end

get '/healthcheck' do
  "ok"
end

get '/message' do
  simpleFile = File.new("test.txt", "r")
  if simpleFile
    data = simpleFile.sysread(20)
    data
  else
    "Not able to access the file"
  end
rescue Errno::ENOENT
  "Message file is missing"
end
