module CloudfilesCli
  class Cli < Thor
    desc "download CONTAINER REMOTE_FILENAME [LOCAL_FILENAME]", "Download a file"
    option :username
    option :api_key
    option :auth_url
    def download(container, remote_filename, local_filename=nil)
      Transactions.new(Config.new(options)).download(container, remote_filename, local_filename || File.basename(remote_filename))
    end

    desc "upload CONTAINER LOCAL_FILENAME [REMOTE_FILENAME]", "Upload a file"
    option :username
    option :api_key
    option :auth_url
    def upload(container, local_filename, remote_filename=nil)
      Transactions.new(Config.new(options)).upload(container, local_filename, remote_filename || File.basename(local_filename))
    end
  end
end
