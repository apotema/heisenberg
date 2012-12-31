require "rack/test"
require "heisenberg/hashext"
require "heisenberg/version"
require "heisenberg/api_integration_spec"

module Heisenberg
  if defined? RSpec
    RSpec.configure do |config|
      config.include ApiIntegrationSpec,
        example_group: { file_path: /spec\/rest_apis/ },
        type: :rest_api
    end

    require "heisenberg/matchers"
  end
end
