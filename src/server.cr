require "kemal"
require "http/client"
require "http/headers"

headers = HTTP::Headers.new
headers.add "Authorization", "Bearer <TOKEN>"

before_all do |env|
  env.response.content_type = "application/json"
end

get "/" do
  "The server is running."
end

get "/things" do
  api_response = HTTP::Client.get "https://api.airtable.com/v0/appBYEa4vGVLAXEbe/Things", headers
  api_response.body
end

Kemal.run