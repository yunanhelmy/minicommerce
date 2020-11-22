class API::V1::SharedEntities::WineBouncer::Errors::OAuthForbiddenError < Grape::Entity
  expose :errors, documentation: {type: Array[String], example: ['403 Forbidden. You need private scopes']}
end