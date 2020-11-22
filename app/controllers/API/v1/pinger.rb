module API
  module V1
    class Pinger < API::V1::ApiResource
      helpers API::V1::Helpers

      resource "pinger" do
        desc "Ping" do
          detail "Ping"
        end
        get "/ping" do
          "pong"
        end

        desc "Ping secure" do
          failure API::V1::Helpers.basic_errors
        end
        oauth2 "public"
        get "/pong" do
          "ping"
        end
      end
    end
  end
end
