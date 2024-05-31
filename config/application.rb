require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module UserAuthService
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # Configuración del almacenamiento de sesiones en una aplicación Ruby on Rails
    # Esta línea configura el almacenamiento de sesiones utilizando cookies.
    # `:cookie_store` especifica que las sesiones se almacenarán en el lado del cliente dentro de una cookie.
    # `key: '_interslice_session'` define el nombre de la clave de la cookie que almacenará los datos de la sesión.
    config.session_store :cookie_store, key: '_interslice_session'

    # Estas líneas añaden middleware necesario para manejar cookies y sesiones.
    # `ActionDispatch::Cookies` es un middleware que gestiona la funcionalidad de las cookies en la aplicación.
    config.middleware.use ActionDispatch::Cookies

    # `config.session_store` y `config.session_options` son utilizados aquí para configurar el middleware
    # de almacenamiento de sesiones con las opciones definidas previamente.
    config.middleware.use config.session_store, config.session_options
  end
end
