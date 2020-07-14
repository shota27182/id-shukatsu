require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module IdShukatsu
  class Application < Rails::Application
    config.load_defaults 5.2
    I18n.config.available_locales = :ja
    I18n.default_locale = :ja
    config.assets.initialize_on_precompile = false
    config.autoload_paths += Dir[Rails.root.join('app', '*')]
    config.active_record.default_timezone = :local
    config.time_zone = 'Tokyo'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil

    # エラーメッセージを含むフィールドが自動的にfield_with_errorsクラスを持つdivタグで囲まれるのを防ぐ
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      %Q(#{html_tag}).html_safe
    end
    
  end
end
