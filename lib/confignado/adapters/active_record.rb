module Confignado
  module Adapters
    class ActiveRecord < Confignado::Adapters::Base
      def key
        :active_record
      end

      def process
        get_configuration.merge! @data
      end

      private

      def get_configuration
        ActiveRecord::Base.configurations[:development]
      end
    end
  end
end
