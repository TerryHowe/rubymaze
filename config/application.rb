require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rubymaze
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Opt in to the Rails 8.0+ behavior: `to_time` preserves the receiver's
    # full timezone instead of just its UTC offset. Silences the deprecation
    # warning and is the only behavior Rails 8.1 supports.
    config.active_support.to_time_preserves_timezone = :zone

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
