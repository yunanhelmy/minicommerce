module API
  module V1
    module Users
      module Resources
        class Omniauth < API::V1::ApiResource
          helpers API::V1::Helpers

          resource 'users' do
            desc 'Omniauth user' do
            end
            params do
              requires :provider, type: String, desc: '[Assertion] Provider', values: ["", "twitter", "facebook"]
              requires :assertion, type: String, desc: "[Assertion] Assertion / Twitter Oauth access token / Facebook access token"
              optional :assertion_secret, type: String, desc: "[Assertion] Assertion secret / Twitter Oauth access token secret"
            end
            post "/omniauth" do
              present :pending
            end
          end
        end
      end
    end
  end
end
