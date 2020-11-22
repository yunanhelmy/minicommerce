module CustomTokenResponse
  def body
    additional_data = {}
    additional_data = @token.resource_owner_id ? API::V1::Users::Entities::User.represent(User.find(@token.resource_owner_id)) : nil
    super.merge({user: additional_data.as_json})
  end
end
