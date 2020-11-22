module API::V1::Helpers
  def self.authentication_errors
    [
      [400, 'Access token is invalid.', API::V1::SharedEntities::WineBouncer::Errors::OAuthUnauthorizedError],
      [401, 'Access token is expired.', API::V1::SharedEntities::WineBouncer::Errors::OAuthUnauthorizedError],
      [402, 'Access token is revoked.', API::V1::SharedEntities::WineBouncer::Errors::OAuthUnauthorizedError],
      [403, 'Forbidden. Missing scopes.', API::V1::SharedEntities::WineBouncer::Errors::OAuthForbiddenError]
    ]
  end

  def self.common_errors
    [
      [500, 'Internal server error.', API::V1::SharedEntities::InternalServerError]
    ]
  end

  def self.pagination_errors
    [
      [405, 'Out of pagination', API::V1::SharedEntities::Pagy::OverflowError]
    ]
  end

  def self.validation_errors
    [
      [422, 'Invalid record.', API::V1::SharedEntities::InvalidRecord],
      [406, 'Invalid request.', API::V1::SharedEntities::InvalidRequest],
      [404, 'Record not found.', API::V1::SharedEntities::RecordNotFound],
    ]
  end

  def self.basic_errors
    self.common_errors.concat(self.authentication_errors)
  end

  def self.input_errors
    self.basic_errors.concat(self.validation_errors)
  end

  def self.resource_errors
    self.basic_errors.concat(self.pagination_errors)
  end
end
