class API::V1::SharedEntities::InvalidRequest < Grape::Entity
  expose :errors, documentation: {type: Array[String], example: ["Invalid request"]}
end