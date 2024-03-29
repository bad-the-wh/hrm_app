require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HrmApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # This also configures session_options for use below
    config.session_store :cookie_store, key: '_interslice_session'

    # Required for all session management (regardless of session_store)
    config.middleware.use ActionDispatch::Cookies

    config.middleware.use config.session_store, config.session_options

    

    #Rails.application.config.middleware.insert_before 0, Rack::Cors do
    #  allow do
    #    origins 'http://localhost:8080' # Replace with the actual URL of your Vue.js app
    #    resource '*',
    #      headers: :any,
    #      methods: [:get, :post, :put, :patch, :delete, :options, :head],
    #      credentials: true,
    #      format: :json
    #  end
    #end

    config.action_controller.default_protect_from_forgery = {
      with: :exception,
      unless: -> { request.format.json? }
    }

    
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
