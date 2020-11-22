class Users::Repository::Token
  def self.call user_id, application:
    Doorkeeper::AccessToken.find_or_create_for(
      application, user_id,
      'public',
      Doorkeeper.configuration.access_token_expires_in.to_i,
      true
    )
  end
end
