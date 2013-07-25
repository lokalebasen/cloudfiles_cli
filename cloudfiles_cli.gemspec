# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cloudfiles_cli/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jacob Atzen"]
  gem.email         = ["jacob@incremental.dk"]
  gem.description   = %q{Simple utility for uploading and downloading files from Cloudfiles}
  gem.summary       = %q{Easily upload and download files from Cloudfiles}
  gem.homepage      = "https://github.com/lokalebasen/cloudfiles_cli"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cloudfiles_cli"
  gem.require_paths = ["lib"]
  gem.version       = CloudfilesCli::VERSION
  gem.add_dependency "thor"
  gem.add_dependency "fog"
  gem.executables << 'cloudfiles_cli'
end
