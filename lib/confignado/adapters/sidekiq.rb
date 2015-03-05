module Confignado
  module Adapters
    class Sidekiq < Confignado::Adapters::Base
      def key
        :sidekiq
      end

      def process
        process_client @data[:client]
        process_system @data[:server]
      end

      private

      def process_client(configuration)
        Sidekiq.configure_client do |config|
          config.redis = { url: configuration[:redis][:url] }
        end
      end

      def process_server(configuration)
        Sidekiq.configure_server do |config|
          config.redis = { url: configuration[:redis][:url] }
        end
      end
    end
  end
end
