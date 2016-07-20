if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'byebug'
require 'pry'
require 'pry-byebug'

require 'rspec/its'

require 'dao/entity'

require 'support/comment'
require 'support/post'
