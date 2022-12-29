# frozen_string_literal: true

module Api
  module V1
    module Overrides
      # RegistrationsController api
      class RegistrationsController < ::DeviseTokenAuth::RegistrationsController
        before_action :configure_permitted_parameters
        # override this method to customise how the resource is rendered. in this case an ActiveModelSerializers 0.10 serializer.
        def render_create_success
          render json: { data: ActiveModelSerializers::SerializableResource.new(@resource).as_json }
        end

        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: %i[username name avatar])
          devise_parameter_sanitizer.permit(:account_update, keys: %i[username name avatar])
        end
      end
    end
  end
end
