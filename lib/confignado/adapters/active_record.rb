module Confignado
  module Adapters
    class ActiveRecord < Confignado::Adapters::Base
      def self.key
        :active_record
      end

      def process
        active_record_configuration = @configuration.select do |key, value|
          %w(adapter database host user).include? key
        end

        process_configuration active_record_configuration

        ::ActiveRecord::Base.logger = Logger.new(File.open @configuration['log'], 'a')
        ::ActiveRecord::Base.raise_in_transactional_callbacks = @configuration['raise_in_transactional_callbacks']

        ::ActiveRecord::Base.establish_connection Confignado.environment.to_sym
      end

      private

      def process_configuration(configuration)
        ::ActiveRecord::Base.configurations[Confignado.environment] = configuration
      end
    end
  end
end

Confignado.register Confignado::Adapters::ActiveRecord
