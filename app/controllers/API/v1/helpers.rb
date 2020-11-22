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

  def render_result(resource, contract = nil, &block)
    contract_name = contract || resource["contract.default"]
    if resource.success?
      yield
    else
      if resource["result.policy.default"].present? && resource["result.policy.default"].failure?
        error! resource["result.policy.message"], 403
      end
      if contract_name.nil?
        present :status, resource.success?
      else
        error! contract_name.errors.full_messages.join(", "), 422
      end
    end
  end

  def present_metas_pagy resources
    total_pages  = resources.pages
    limit_value  = params.per_page || Pagy::VARS[:max_per_page]
    current_page = params.page || 1
    present :meta, { total_pages: total_pages, limit_value: limit_value, current_page: current_page }, with: API::V1::Metas::Entities::Meta
  end
end
