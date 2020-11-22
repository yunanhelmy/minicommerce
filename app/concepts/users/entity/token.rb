class Users::Entity::Token < Grape::Entity
  expose :user, with: Users::Entity::User
  expose :token do
    expose :access_token
    expose :token_type
    expose :expires_in
    expose :refresh_token
    expose :scope
    expose :created_at
  end

  private
    def access_token
      object.token
    end

    def scope
      object.scopes.to_s
    end

    def created_at
      object.created_at.to_i
    end

    def user
      options[:user]
    end
end
