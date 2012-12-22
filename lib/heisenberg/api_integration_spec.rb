module Heisenberg
  module ApiIntegrationSpec
    extend ActiveSupport::Concern

    included do
      include Rack::Test::Methods
      include Rails.application.routes.url_helpers

      metadata[:type] = :rest_api

      Rails.application.routes.default_url_options[:host] = Rack::Test::DEFAULT_HOST

      def app
        Rails.application
      end

      def last_response_json
        parsed_json = JSON.parse(last_response.body)
        parsed_json = parsed_json.recursive_symbolize_keys if parsed_json.is_a? Hash
        parsed_json = parsed_json.map(&:recursive_symbolize_keys) if parsed_json.is_a? Array
        parsed_json
      end

      def serialize resource, options = {}
        if resource.is_a? Array
          array_serializer = options.fetch(:serializer) { ActiveModel::ArraySerializer }
          array_serializer.new(resource, options).as_json
        else
          serializer = options.fetch(:serializer) { resource.active_model_serializer }
          serializer.new(resource).as_json
        end
      end

      before :each do
        header 'Accept', "application/json"
      end
    end
  end
end