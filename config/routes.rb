Rails.application.routes.draw do
  devise_for :users
  use_doorkeeper
  mount GrapeSwaggerRails::Engine, as: "doc", at: "/doc"
  mount API::Init, at: "/"
end
