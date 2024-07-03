require "test_helper"
require 'capybara/rails'
require 'capybara/minitest'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # モジュール
  include SignInHelper

  Capybara.register_driver :remote_chrome do |app|
    url = ENV['SELENIUM_REMOTE_URL'] || 'http://selenium_chrome:4444/wd/hub'
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--no-sandbox')
    options.add_argument('--window-size=1400,1400')
    options.add_argument('--single-process')
    options.add_argument('--disable-extensions')
    Capybara::Selenium::Driver.new(app, browser: :remote, url: url, options: options)
  end

  driven_by :remote_chrome

  Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
  Capybara.app_host = "http://#{Capybara.server_host}"
  Capybara.default_max_wait_time = 10
end
