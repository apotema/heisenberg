require "rack/test"

require "chewbacca/hashext"
require "chewbacca/version"
require "chewbacca/api_integration_spec"

module Chewbacca
  if defined? RSpec
    RSpec.configure do |config|
      config.include ApiIntegrationSpec, type: :api_integration
    end

    RSpec::Matchers.define :be_status_for do |expected|
      match do |actual|
        actual == case expected
          when :success then 200
          when :created then 201
          when :no_content then 204
          when :bad_request then 400
          when :unauthorized then 401
          when :forbidden then 403
        end
      end
    end
  end
end
