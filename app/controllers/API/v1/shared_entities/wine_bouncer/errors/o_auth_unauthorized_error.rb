class API::V1::SharedEntities::WineBouncer::Errors::OAuthUnauthorizedError < Grape::Entity
  expose :errors, documentation: {type: Array[String], example: ["401 Unauthorized."]}
end