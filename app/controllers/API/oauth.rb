module API
  class Oauth < Grape::API

    AUTHORIZATION_HEADERS = { Authorization: { description: 'Authorization', required: true } }.freeze

    resources :oauth do
      desc 'Authorization' do
        detail 'Login'
        failure [ { code: 401, message: 'Unauthorized' }, { code: 400, message: 'Bad request' }, { code: 500, message: 'Internal server error' } ]
      end
      params do
        requires :grant_type, type: String, values: %w(refresh_token password), default: 'password'
        requires :client_id, type: String, default: (Doorkeeper::Application.first.uid unless Rails.env.test?)
        optional :client_secret, type: String, default: (Doorkeeper::Application.first.secret unless Rails.env.test?)
        optional :refresh_token, type: String, desc: '[Refresh token] Your refresh token'
        optional :login, type: String, desc: '[Resource Password] Login (email)', default: 'm.yunan.helmy@gmail.com'
        optional :password, type: String, desc: '[Resource Password] Password', default: 'yunan123'
      end
      post :token do
      end

      desc 'Revoke token' do
        detail 'Logout'
      end
      params do
        requires :client_id, type: String, default: (Doorkeeper::Application.first.uid unless Rails.env.test?)
        optional :client_secret, type: String, default: (Doorkeeper::Application.first.secret unless Rails.env.test?)
        optional :token, type: String, desc: 'Your token'
      end
      post :revoke do
      end

      desc 'Get token info' do
        headers AUTHORIZATION_HEADERS
        detail 'Token information: "Bearer XYZ"'
      end
      get "token/info" do
      end

      desc 'Token introspection' do
        detail 'Token Introspection'
      end
      params do
        requires :client_id, type: String, default: (Doorkeeper::Application.first.uid unless Rails.env.test?)
        optional :client_secret, type: String, default: (Doorkeeper::Application.first.secret unless Rails.env.test?)
        requires :token, type: String
      end
      post :introspect do
      end
    end # resources :oauth


    # Swagger config
    add_swagger_documentation(
      api_version:             'v1',
      doc_version:             'v1',
      hide_documentation_path: true,
      mount_path:              "doc/oauth",
      hide_format:             true,
      info: {
        title: "Authentication",
        description: "Authentication"
      }
    )
  end
end
