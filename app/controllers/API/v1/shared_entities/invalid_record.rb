class API::V1::SharedEntities::InvalidRecord < Grape::Entity
  expose :errors, documentation: {type: Array[String], example: ["Invalid record"]}
end