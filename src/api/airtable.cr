module API
  class Airtable
    @headers : HTTP::Headers
    @base : String

    def initialize(api_key : String, @base : String)
      @headers = HTTP::Headers.new
      @headers.add "Authorization", "Bearer #{api_key}"
    end

    def in(table : String) : Table
      Table.new table, @base, @headers
    end
  end

  class Table
    @name : String
    @base : String
    @headers : HTTP::Headers

    def initialize(@name : String, @base : String, @headers : HTTP::Headers)
    end

    def all : String
      api_response = HTTP::Client.get "https://api.airtable.com/v0/#{@base}/#{@name}", @headers
      api_response.body
    end
  end
end