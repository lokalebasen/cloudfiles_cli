module CloudfilesCli
  class Transactions
    attr_reader :config

    def initialize(config)
      @config = config
    end

    def connection
      @cf ||= Fog::Storage.new(config.hash.merge(:provider => 'Rackspace'))
    end

    def upload(container_name, localfile, remotefile)
      container = connection.directories.get(container_name)
      object = container.files.create(
        :key => remotefile, :body => File.open(localfile)
      )
    end

    def download(container_name, remotefile, localfile)
      container = connection.directories.get(container_name)
      object = container.files.get(remotefile)
      if object.nil?
        STDERR.puts "File #{remotefile} not found on cloudfiles"
        exit 1
      else
        IO.binwrite(localfile, object.body)
      end
    end
  end
end
