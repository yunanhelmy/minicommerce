module API
  module V1
    module Config
      def self.included(base)
        base.instance_eval do
          default_format :json
          version 'v1', using: :path, vendor: 'minicommerce'
          format :json
          content_type :json, 'application/json; charset=UTF-8'
        end
      end
    end
  end
end
