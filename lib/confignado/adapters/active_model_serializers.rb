module Confignado
  module Adapters
    class ActiveModelSerializers < Confignado::Adapters::Base
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

Confignado.register Confignado::Adapters::ActiveModelSerializers
