module API
  module SuccessFormatter
    def self.call object, env
      return {
        :data => object
      }.to_json
    end
  end
end
