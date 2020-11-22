module API::Routes
  module V1
    def self.included(base)
      base.instance_eval do
        # Mount any API modules
        mount API::V1::Main
      end
    end
  end
end
