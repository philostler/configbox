module ConfigBox
  module Adapters
    class ActiveModelSerializers < ConfigBox::Adapters::Base
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

ConfigBox.register ConfigBox::Adapters::ActiveModelSerializers
