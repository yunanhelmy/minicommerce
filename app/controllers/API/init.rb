module API
  class Init < Grape::API
    # Create log in console
    if Rails.application.credentials.api[:debugging] == true
      insert_after Grape::Middleware::Formatter, Grape::Middleware::Logger, {
          logger:  Logger.new(STDERR),
          filter:  Class.new {
            def filter(opts)
              opts.reject { |k, _| k.to_s == 'password' }
            end }.new,
          headers: %w(version cache-control)
      }
    end

    # Build params using object
    include Grape::Extensions::Hashie::Mash::ParamBuilder

    include API::Routes::V1

    mount API::Oauth

    GrapeSwaggerRails.options.app_url            = "/v1/doc"
    GrapeSwaggerRails.options.url                = "/api"
    GrapeSwaggerRails.options.hide_url_input     = false
    GrapeSwaggerRails.options.hide_api_key_input = false
    GrapeSwaggerRails.options.api_auth           = 'bearer'
    GrapeSwaggerRails.options.api_key_name       = 'Authorization'
    GrapeSwaggerRails.options.api_key_type       = 'header'
  end
end
