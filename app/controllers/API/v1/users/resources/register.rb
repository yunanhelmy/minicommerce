module API
  module V1
    module Users
      module Resources
        class Register < API::V1::ApiResource
          resource 'users' do
            desc 'User registration' do
            end
            params do
              requires :email, type: String, desc: "Email"
              requires :password, type: String, desc: 'Password'
              requires :password_confirmation, type: String, desc: 'Password confirmation'
            end
            post "/" do
              present true
            end
          end
        end
      end
    end
  end
end
