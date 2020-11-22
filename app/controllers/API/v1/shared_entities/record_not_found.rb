class API::V1::SharedEntities::RecordNotFound < Grape::Entity
  expose :errors, documentation: {type: Array[String], example: ["Invalid record"]}
end
