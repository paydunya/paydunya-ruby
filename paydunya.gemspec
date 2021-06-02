# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paydunya/version'

Gem::Specification.new do |spec|
  spec.name          = 'paydunya'
  spec.version       = Paydunya::VERSION
  spec.author = 'PAYDUNYA'
  spec.email         = ['paydunya@paydunya.com']
  spec.description   = 'Ruby library for integrating with the PAYDUNYA Gateway'
  spec.summary       = 'Ruby client bindings for the PAYDUNYA API'
  spec.homepage      = 'https://paydunya.com/developers/ruby'
  spec.post_install_message = "Thanks for installing PAYDUNYA Ruby client.\nYou may read full API docs at https://paydunya.com/developers/ruby"
  spec.required_ruby_version = '>= 3.0'
  spec.files = Dir['README.md', 'lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.license       = 'MIT'
  # Dependencies
  spec.add_dependency('faraday', '~> 1.4', '>= 1.4.2')

  # Dev Dependencies
  spec.add_development_dependency('awesome_print')
  spec.add_development_dependency('guard-rspec')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('simplecov')
  spec.add_development_dependency 'webmock'
end
