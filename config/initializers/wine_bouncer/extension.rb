module WineBouncer
  module Extension
    def oauth2(*scopes)
      scopes = Doorkeeper.configuration.default_scopes.all if scopes.all? { |x| x.nil? }
      description = if respond_to?(:route_setting) # >= grape-0.10.0
                      route_setting(:description) || route_setting(:description, {})
                    else
                      @last_description ||= {}
                    end

      # Additional detail for scopes
      displayed_scopes = "Scopes : #{scopes.join(" / ")}"
      description[:detail] = description[:detail].present? ? [description[:detail], displayed_scopes].join('<br> ') : displayed_scopes

      # case WineBouncer.configuration.auth_strategy
      # when :default
      description[:auth] = { scopes: scopes }
      # when :swagger
      description[:authorizations] = { oauth2: scopes.map { |x| { scope: x } } }
      # end
    end

    # Grape::API::Instance is defined in grape 1.2.0 or above
    grape_api = defined?(Grape::API::Instance) ? Grape::API::Instance : Grape::API
    grape_api.extend self
  end
end