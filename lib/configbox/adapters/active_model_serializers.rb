module Configbox
  module Adapters
    class ActiveModelSerializers < Configbox::Adapters::Base
      def self.key
        :active_model_serializers
      end

      def process
        ActiveModel::Serializer.root = @configuration['root']
        ActiveModel::ArraySerializer.root = @configuration['array_root']
      end
    end
  end
end

Configbox.register Configbox::Adapters::ActiveModelSerializers
