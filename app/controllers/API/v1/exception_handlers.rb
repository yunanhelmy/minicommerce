module API
  module V1
    module ExceptionHandlers
      def self.included(base)
        base.instance_eval do

          rescue_from :all do |e|
            if e.class.name.in? ['Twitter::Error::Unauthorized', 'Twitter::Error::Forbidden', 'Koala::Facebook::AuthenticationError', 'Doorkeeper::Errors::DoorkeeperError']
              # Invalid credential
              code    = 422
              message = e.message
            elsif e.class.name == 'Grape::Exceptions::ValidationErrors'
              # When required params are missing or validation fails
              code    = 406
              message = e.message
            # Record not found
            elsif e.is_a?(ActiveRecord::RecordNotFound)
              code    = 404
              model   = e.model.constantize.model_name.human(locale: :id).downcase
              message = e.model.constantize.model_name.human(locale: :id) + " " + I18n.t(:'activerecord.errors.messages.record_not_found', model: model, locale: :en)
            # Record invalid
            elsif e.is_a?(ActiveRecord::RecordInvalid)
              code    = 422
              message = e.record.errors.full_messages.join(", ")
            elsif e.is_a?(ActiveRecord::RecordNotUnique)
              code    = 422
              message = "Record Not Unique"
            elsif e.is_a?(ActiveRecord::RecordNotDestroyed)
              code    = 422
              message = e.message
            # Pagy overflow
            elsif e.is_a? Pagy::OverflowError
              # Pagy overflow
              code    = 405
              message = "Out of page :("
            elsif e.is_a? WineBouncer::Errors::OAuthUnauthorizedError
              case e.response.reason
              when :expired
                code    = 401
              when :revoked
                code    = 402
              when :invalid
                code    = 400
              else
                code    = 400
              end
              message = e.to_s
            elsif e.is_a? WineBouncer::Errors::OAuthForbiddenError
              # missing scopes
              code    = 403
              message = '403 Forbidden. You need ' + e.to_s.downcase
            else
              # Any unhandled error
              code    = 500
              message = e.message
            end

            error! message, code
          end

        end
      end
    end
  end
end
