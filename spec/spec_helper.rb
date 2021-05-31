require 'bundler'
require 'simplecov'

SimpleCov.minimum_coverage 70
SimpleCov.maximum_coverage_drop 25

Bundler.setup
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'paydunya'