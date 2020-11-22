module API
  module ErrorFormatter
    def self.call message, backtrace, options, env, original_exception
      error = if Rails.application.credentials.api[:debugging] == true
                {
                  debug:  [backtrace],
                  errors: [message]
                }
              else
                {
                  errors: [message]
                }
              end

      return {
        error: error
      }.to_json
    end
  end
end
