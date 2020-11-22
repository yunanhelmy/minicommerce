class API::V1::SharedEntities::InternalServerError < Grape::Entity
  expose :errors, documentation: {type: Array[String], example: ["Internal server error"]}
end