require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #

    # Rackミドルウェアで発生した独自で定義した例外をハンドリングする方法
    # 開発環境では、別のRackミドルウェアがエラー用の開発ページを用意してくれています。(どんなエラーが起きたのか？などを表示してくれてる馴染みの画面)
    # そのため、開発環境で例外ページを確認する場合は、`config/environments/development.rb`で調整が必要になります。
    config.action_dispatch.rescue_responses.merge!("YourCustomException" => :not_found)

    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja

    config.autoload_paths += %W(#{config.root}/app/forms)
    # config.eager_load_paths << Rails.root.join("extras")

    config.active_storage.variant_processor = :vips
  end
end
