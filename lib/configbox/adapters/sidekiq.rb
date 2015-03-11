module Configbox
  module Adapters
    class Sidekiq < Configbox::Adapters::Base
      def key
        :sidekiq
      end

      def process
        process_client @configuration['client']
        process_system @configuration['server']
      end

      private

      def process_client(configuration)
        Sidekiq.configure_client do |config|
          config.redis = { url: configuration['redis']['url'] }
        end
      end

      def process_server(configuration)
        Sidekiq.configure_server do |config|
          config.redis = { url: configuration['redis']['url'] }
        end
      end
    end
  end
end

Configbox.register Configbox::Adapters::Sidekiq
