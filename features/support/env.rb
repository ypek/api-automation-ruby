require 'cucumber'
require 'bundler'
require 'rspec'
require 'excon'
require 'pry'
require 'faker'


ENVIROMENT = ENV['ENVIROMENT']


CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENVIROMENT}.yaml"))


$base_uri = CONFIG['uri']