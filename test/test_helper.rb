ENV['RAILS_ENV'] ||= 'test'
# どのファイルを読み込むよりも先に実施してください。
require "simplecov"
SimpleCov.start 'rails'

require_relative "../config/environment"
require_relative './support/sign_in_helper.rb'
require "rails/test_help"
require "minitest/mock"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors) # カバレッジ測定(SimpleCov実行)時には、並列テストの設定を切るようにしてください。

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end
