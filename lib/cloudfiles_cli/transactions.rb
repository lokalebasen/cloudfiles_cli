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
      container(container_name).files.create(
        :key => remotefile, :body => File.open(localfile)
      )
    end

    def download(container_name, remotefile, localfile)
      object = container(container_name).files.get(remotefile)
      if object.nil?
        abort "File #{remotefile} not found on cloudfiles"
      else
        IO.binwrite(localfile, object.body)
      end
    end

    def container(container_name)
      connection.directories.get(container_name) ||
        abort("Container #{container_name} not found on cloudfiles")
    end
  end
end
