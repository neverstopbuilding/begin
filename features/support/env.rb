require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'begin/generator'

require 'rspec/expectations'
require 'aruba/cucumber'

Before do
  dir = 'build/tmp'
  FileUtils.rm_rf dir if File.directory?(dir)
  @dirs = [dir]
end
