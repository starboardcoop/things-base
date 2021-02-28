require "kemal"
require "./api/airtable"

base = API::Airtable.new "key56RuO6gkPkLBnG", "appBYEa4vGVLAXEbe"

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