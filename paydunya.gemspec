# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paydunya/version'

Gem::Specification.new do |gem|
  gem.name          = "paydunya"
  gem.version       = Paydunya::VERSION
  gem.author       = "PAYDUNYA"
  gem.email         = ["paydunya@paydunya.com"]
  gem.description   = %q{Ruby library for integrating with the PAYDUNYA Gateway}
  gem.summary       = %q{Ruby client bindings for the PAYDUNYA API}
  gem.homepage      = "https://paydunya.com/developers/ruby"
  gem.post_install_message = "Thanks for installing PAYDUNYA Ruby client.\nYou may read full API docs at https://paydunya.com/developers/ruby"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('faraday', '~> 0.9.0')
  gem.add_dependency('faraday_middleware', '~> 0.9', '>= 0.9.1')
  gem.add_dependency('multi_json', '~> 1.10', '>= 1.10.1')
  gem.add_dependency('rest-client', '~> 1.7', '>= 1.7.2')
  gem.add_dependency('rspec')
  gem.add_development_dependency('rake', '~> 10.2', '>= 10.2.2')
  gem.add_development_dependency('simplecov')
end
