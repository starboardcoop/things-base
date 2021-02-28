require "yaml"

class Configuration
    getter api_key : String
    getter base : String

    protected def initialize(@api_key : String, @base : String)
    end

    def self.load : Configuration
        yaml = File.open("./config.yml") do |file|
            YAML.parse file
        end

        Configuration.new yaml["api_key"].as_s, yaml["base"].as_s
    end
end