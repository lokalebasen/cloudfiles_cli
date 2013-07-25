# CloudfilesCli

A small utility for interacting with files stored on Rackspace Cloudfiles

## Installation

Install it:

    $ gem install cloudfiles_cli

## Usage

Basic usage:

    $ cloudfiles_cli help

Either pass in credentials on the command line:

    $ cloudfiles_cli upload --username=john --api-key=something --auth-url=https://lon.identity.api.rackspacecloud.com/v2.0 my_dir some_file.txt remote_filename.txt

Or use environment variables:

    $ export CLOUDFILES_USERNAME=john
    $ export CLOUDFILES_API_KEY=something
    $ export CLOUDFILES_AUTH_URL=https://lon.identity.api.rackspacecloud.com/v2.0
    $ cloudfiles_cli upload my_dir some_file.txt remote_filename.txt

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
