module CloudfilesCli
  class Config
    attr_reader :options
    def initialize(options)
      @options = options
    end

    def username
      options[:username] || ENV['CLOUDFILES_USERNAME'] || raise("No username provided")
    end

    def api_key
      options[:api_key] || ENV['CLOUDFILES_API_KEY'] || raise("No api key provided")
    end

    def auth_url
      options[:auth_url] || ENV['CLOUDFILES_AUTH_URL'] || raise("No auth url provided")
    end

    def hash
      {
        :rackspace_username => username,
        :rackspace_api_key  => api_key,
        :rackspace_auth_url => auth_url
      }
    end
  end
end
