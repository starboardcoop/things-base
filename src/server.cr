require "kemal"
require "http/client"
require "http/headers"

module API
  class Airtable
    @headers : HTTP::Headers
    @base : String

    def initialize(api_key : String, @base : String)
      @headers = HTTP::Headers.new
      @headers.add "Authorization", "Bearer #{api_key}"
    end

    def all(table : String) : String
      api_response = HTTP::Client.get "https://api.airtable.com/v0/#{@base}/#{table}", @headers
      api_response.body
    end
  end
end

base = API::Airtable.new "key56RuO6gkPkLBnG", "appBYEa4vGVLAXEbe"

before_all do |env|
  env.response.content_type = "application/json"
end

get "/" do
  "The server is running."
end

get "/things" do
  base.all "Things"
end

Kemal.run