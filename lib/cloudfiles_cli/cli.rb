module CloudfilesCli
  class Cli < Thor
    desc "download CONTAINER REMOTE_FILENAME [LOCAL_FILENAME]", "Download a file"
    option :username
    option :api_key
    option :auth_url
    option :region
    def download(container, remote_filename, local_filename=nil)
      Transactions.new(Config.new(options)).download(container, remote_filename, local_filename || File.basename(remote_filename))
    end

    desc "upload CONTAINER LOCAL_FILENAME [REMOTE_FILENAME]", "Upload a file"
    option :username
    option :api_key
    option :auth_url
    option :region
    def upload(container, local_filename, remote_filename=nil)
      Transactions.new(Config.new(options)).upload(container, local_filename, remote_filename || File.basename(local_filename))
    end

    desc "exists CONTAINER REMOTE_FILENAME", "Check if file exists"
    option :username
    option :api_key
    option :auth_url
    option :region
    def exists(container, remote_filename)
      Transactions.new(Config.new(options)).exists(container, remote_filename)
    end

    desc "list [CONTAINER]", "List containers or container contents"
    option :username
    option :api_key
    option :auth_url
    option :region
    def list(container = nil)
      Transactions.new(Config.new(options)).list(container)
    end

    desc "delete CONTAINER REMOTE_FILENAME", "Deletes a remote file"
    option :username
    option :api_key
    option :auth_url
    option :region
    def delete(container, *remote_filenames)
      Transactions.new(Config.new(options)).delete(container, remote_filenames)
    end
  end
end
