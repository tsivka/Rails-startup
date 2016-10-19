require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Beauty
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    # Google API Browser key
    # stepan.pakholok@lezgro.com account https://console.developers.google.com
    #  enabled:
    # - Google Maps Javascript API
    # - Google Static Maps API
    config.x.google_api_key = 'AIzaSyAB15_FAHGOJ5x-H7n442vWeEODI3MvSiA'

    config.active_record.raise_in_transactional_callbacks = true
    config.assets.enabled = true
    config.assets.paths << "#{Rails.root}/app/assets/videos"

  end
end
