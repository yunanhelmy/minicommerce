class API::V1::SharedEntities::Pagy::OverflowError < Grape::Entity
  expose :errors, documentation: {type: Array[String], example: ["Out of page :("]}
end