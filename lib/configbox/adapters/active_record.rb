module ConfigBox
  module Adapters
    class ActiveRecord < ConfigBox::Adapters::Base
      def self.key
        :active_record
      end

      def process
        active_record_configuration = @configuration.stringify_keys.select do |key|
          %w(adapter database host user).include? key
        end

        process_configuration active_record_configuration

        ::ActiveRecord::Base.logger = Logger.new(File.open @configuration[:log], 'a')
        ::ActiveRecord::Base.raise_in_transactional_callbacks = @configuration[:raise_in_transactional_callbacks]

        ::ActiveRecord::Base.establish_connection ConfigBox.environment.to_sym
      end

      private

      def process_configuration(configuration)
        ::ActiveRecord::Base.configurations[ConfigBox.environment] = configuration
      end
    end
  end
end

ConfigBox.register ConfigBox::Adapters::ActiveRecord
