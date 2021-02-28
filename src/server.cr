require "kemal"
require "./configuration"
require "./api/airtable"

config = Configuration.load
base = API::Airtable.new config.api_key, config.base

before_all do |env|
  env.response.content_type = "application/json"
end

get "/" do
  "The server is running."
end

get "/things" do
  base.in("Things").all
end

Kemal.run