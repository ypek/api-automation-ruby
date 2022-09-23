require 'cucumber'
require 'bundler'
require 'rspec'
require 'excon'
require 'pry'
require 'faker'
require 'json-schema'
require 'jsonpath'


ENVIROMENT = ENV['ENVIROMENT']


CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENVIROMENT}.yaml"))


$base_uri = CONFIG['uri']

Excon.defaults[:ssl_verify_peer] = false