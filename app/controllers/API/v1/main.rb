require "grape-swagger"
require 'doorkeeper/grape/helpers'
require 'minicommerce/version'

module API
  module V1
    class Main < Grape::API
      include API::V1::Config

      helpers Doorkeeper::Grape::Helpers
      use ::WineBouncer::OAuth2

      include API::V1::ExceptionHandlers

      # Mounting Modules
      mount API::V1::Pinger
      mount API::V1::Users::Routes
      mount API::V1::Products::Routes
      mount API::V1::Orders::Routes

      add_swagger_documentation(
          api_version:             Minicommerce::VERSION,
          doc_version:             Minicommerce::VERSION,
          hide_documentation_path: true,
          mount_path:              "doc/api",
          hide_format:             true,
          array_use_braces:        true,
          info: {
              title: "Minicommerce API",
              description: "Minicommerce API"
          }
      )
    end
  end
end
